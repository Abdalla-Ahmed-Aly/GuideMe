import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/data_sources/profile_local_data_source.dart';
import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/core/shared/mapper/photo_mapper.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/features/chat/data/mappers/message_mapper.dart';
import 'package:guide_me/features/chat/data/models/message_model.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:guide_me/features/chat/domain/enums/message_status.dart';
import 'package:guide_me/features/chat/domain/use_cases/get_all_chat_messages.dart';
import 'package:guide_me/features/chat/domain/use_cases/send_message_use_case.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._getAllChatMessagesUseCase,
    this._sendMessageUseCase,
    this._socketEventBus,
  ) : super(ChatInitial());
  final GetAllChatMessagesUseCase _getAllChatMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final SocketEventBus _socketEventBus;

  StreamSubscription? _chatSubscription;
  StreamSubscription? _typingSubscription;

  Timer? _typingTimer;
  final List<MessageEntity> messages = [];

  void safeEmit(ChatState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllChatMessages({
    required String conversationId,
  }) async {
    safeEmit(ChatLoading());
    // _joinChatRoom(conversationId);
    _listenToNewMessages();

    // _listenToTypingEvents();
    final result = await _getAllChatMessagesUseCase(conversationId);
    result.fold(
      (failure) => safeEmit(ChatFailure(failure)),
      (newMessages) {
        messages.addAll(newMessages);
        safeEmit(ChatSuccess(messages));
      },
    );
  }

  Future<void> sendMessage(SendMessageModel sendMessageModel) async {
    final user = getIt<ProfileLocalDataSource>().getCachedUser();

    final tempId = 'temp_${DateTime.now().millisecondsSinceEpoch}';
    final optimisticMessage = MessageEntity(
      id: tempId,
      booking: sendMessageModel.bookingId,
      conversationId: '',
      sender: UserInfoEntity(
        id: user?.id ?? 'temp_me',
        name: user?.name ?? 'Me',
        location: user?.location,
        lat: user?.lat,
        long: user?.lng,
        photo: user?.photo != null ? PhotoMapper.toEntity(user!.photo!) : null,
      ),
      receiver: '',
      message: sendMessageModel.message,
      type: 'text',
      isSeen: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isMine: true,
      status: MessageStatus.loading,
    );

    messages.add(optimisticMessage);
    safeEmit(ChatSuccess(List.from(messages)));

    final result = await _sendMessageUseCase(sendMessageModel);
    result.fold(
      (failure) {
        final index = messages.indexWhere((m) => m.id == tempId);
        if (index != -1) {
          messages[index] = messages[index].copyWith(
            status: MessageStatus.error,
          );
        }
        safeEmit(ChatSuccess(List.from(messages)));
      },
      (_) {
        messages.removeWhere((m) => m.id == tempId);
        safeEmit(ChatSuccess(List.from(messages)));
      },
    );
  }

  Future<void> _listenToNewMessages() async {
    _chatSubscription = _socketEventBus
        .listenTo(SocketAppEvents.chatMessage.value)
        .listen((data) {
          final Map<String, dynamic> json = data is String
              ? jsonDecode(data)
              : data as Map<String, dynamic>;

          final message = MessageModel.fromJson(json['data']['messages'][0]);

          final entity = MessageMapper.toEntity(message);

          messages.removeWhere(
            (m) =>
                m.id.startsWith('temp_') &&
                m.message == entity.message &&
                m.isMine == true,
          );

          messages.add(entity);
          safeEmit(ChatSuccess(List.from(messages)));
        });
  }

  // void sendTypingEvent() {
  //   _socketEventBus.emit(SocketAppEvents.userTyping.value);
  // }

  // void _listenToTypingEvents() {
  //   _typingSubscription = _socketEventBus
  //       .listenTo(SocketAppEvents.userTyping.value)
  //       .listen((data) {
  //         _typingTimer?.cancel(); // كنسل القديم
  //         safeEmit(ChatSuccess(List.from(messages), isTyping: true));
  //         _typingTimer = Timer(const Duration(seconds: 3), () {
  //           safeEmit(ChatSuccess(List.from(messages), isTyping: false));
  //         });
  //       });
  // }

  // void _joinChatRoom(String conversationId) {
  //   if (_currentConversationId == conversationId) return;
  //   _currentConversationId = conversationId;
  //   _socketManager.joinRoom(SocketRooms.joinBooking(conversationId));
  // }

  // void _leaveChatRoom() {
  //   if (_currentConversationId == null) return;
  //   _socketManager.leaveRoom(
  //     SocketRooms.joinBooking(_currentConversationId!),
  //   );
  //   _currentConversationId = null;
  // }

  @override
  Future<void> close() async {
    _chatSubscription?.cancel();
    _typingSubscription?.cancel();
    _typingTimer?.cancel();
    // _leaveChatRoom();
    return super.close();
  }
}
