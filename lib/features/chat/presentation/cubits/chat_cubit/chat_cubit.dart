import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/data_sources/profile_local_data_source.dart';
import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/core/shared/mapper/photo_mapper.dart';
import 'package:guide_me/core/socket/socket_app_events.dart';
import 'package:guide_me/core/socket/socket_event_bus.dart';
import 'package:guide_me/core/socket/socket_manager.dart';
import 'package:guide_me/core/socket/socket_room.dart';
import 'package:guide_me/features/chat/data/mappers/message_mapper.dart';
import 'package:guide_me/features/chat/data/models/message_model.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:guide_me/features/chat/domain/enums/message_status.dart';
import 'package:guide_me/features/chat/domain/use_cases/get_all_chat_messages.dart';
import 'package:guide_me/features/chat/domain/use_cases/send_message_use_case.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._getAllChatMessagesUseCase,
    this._sendMessageUseCase,
    this._socketEventBus,
    this._socketManager,
  ) : super(ChatInitial());
  final GetAllChatMessagesUseCase _getAllChatMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final SocketEventBus _socketEventBus;
  final SocketManager _socketManager;

  StreamSubscription? _chatSubscription;
  StreamSubscription? _messageStatusSubscription;
  String? _currentBookingId;

  final List<MessageEntity> messages = [];

  void safeEmit(ChatState state) {
    if (!isClosed) emit(state);
  }

  String? get _currentUserId =>
      getIt<ProfileLocalDataSource>().getCachedUser()?.id;

  MessageEntity _normalizeOwnership(MessageEntity entity) {
    final currentUserId = _currentUserId;
    if (currentUserId == null || entity.sender.id.isEmpty) {
      return entity;
    }

    final isMine = entity.sender.id == currentUserId;
    if (entity.isMine == isMine) {
      return entity;
    }

    return entity.copyWith(isMine: isMine);
  }

  Future<void> getAllChatMessages({
    required String conversationId,
    required String bookingId,
  }) async {
    safeEmit(ChatLoading());
    messages.clear(); // Clear stale messages from a previous session.

    _joinChatRoom(bookingId);

    final result = await _getAllChatMessagesUseCase(conversationId);
    result.fold(
      (failure) => safeEmit(ChatFailure(failure)),
      (newMessages) {
        messages.addAll(newMessages.map(_normalizeOwnership));
        _listenToNewMessages();
        _listenToMessageStatus();
        safeEmit(ChatSuccess(List.from(messages)));
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
        final index = messages.indexWhere((m) => m.id == tempId);
        if (index != -1) {
          if (messages[index].status != MessageStatus.seen) {
            messages[index] = messages[index].copyWith(
              status: MessageStatus.sent,
            );
          }
        }
        safeEmit(ChatSuccess(List.from(messages)));
      },
    );
  }

  Future<void> _listenToNewMessages() async {
    await _chatSubscription
        ?.cancel(); // Cancel any previous subscription first.
    _chatSubscription = _socketEventBus
        .listenTo(SocketAppEvents.chatMessage.value)
        .listen((data) {
          log("Chat Message: $data");
          if (data is! Map<String, dynamic> && data is! String) return;
          final Map<String, dynamic> json = data is String
              ? jsonDecode(data) as Map<String, dynamic>
              : data as Map<String, dynamic>;

          final message = MessageModel.fromJson(json['data']['messages'][0]);

          final entity = _normalizeOwnership(MessageMapper.toEntity(message));

          if (_currentBookingId != null &&
              entity.booking != _currentBookingId) {
            return;
          }

          final existingIndex = messages.indexWhere((m) => m.id == entity.id);
          if (existingIndex != -1) {
            messages[existingIndex] = entity.copyWith(
              status:
                  messages[existingIndex].status == MessageStatus.seen ||
                      entity.isSeen
                  ? MessageStatus.seen
                  : messages[existingIndex].status,
            );
            safeEmit(ChatSuccess(List.from(messages)));
            return;
          }

          final wasSeenIndex = messages.indexWhere(
            (m) =>
                m.id.startsWith('temp_') &&
                m.booking == entity.booking &&
                m.message == entity.message &&
                m.isMine == true,
          );

          bool wasSeen = false;
          if (wasSeenIndex != -1) {
            wasSeen = messages[wasSeenIndex].status == MessageStatus.seen;
            messages.removeAt(wasSeenIndex);
          }

          late MessageEntity updatedEntity;
          if (!entity.isMine) {
            updatedEntity = entity.copyWith(status: MessageStatus.seen);
          } else {
            if (wasSeen || entity.isSeen) {
              updatedEntity = entity.copyWith(status: MessageStatus.seen);
            } else {
              updatedEntity = entity;
            }
          }
          messages.add(updatedEntity);
          safeEmit(ChatSuccess(List.from(messages)));
        });
  }

  void _listenToMessageStatus() {
    _messageStatusSubscription
        ?.cancel(); // Cancel any previous subscription first.
    _messageStatusSubscription = _socketEventBus
        .listenTo(SocketAppEvents.messagesSeen.value)
        .listen((data) {
          final Map<String, dynamic> json = data is String
              ? jsonDecode(data)
              : data as Map<String, dynamic>;

          final bookingId = json['bookingId']?.toString();
          if (bookingId == null || bookingId != _currentBookingId) {
            return;
          }

          bool isUpdated = false;
          for (var i = 0; i < messages.length; i++) {
            if (messages[i].isMine &&
                messages[i].booking == bookingId &&
                messages[i].status != MessageStatus.seen) {
              messages[i] = messages[i].copyWith(status: MessageStatus.seen);
              isUpdated = true;
            }
          }
          if (isUpdated) {
            safeEmit(ChatSuccess(List.from(messages)));
          }
        });
  }

  void _joinChatRoom(String bookingId) {
    if (_currentBookingId == bookingId) return;
    _currentBookingId = bookingId;
    _socketManager.joinRoom(SocketRooms.joinBooking(bookingId));
  }

  void _leaveChatRoom() {
    if (_currentBookingId == null) return;
    _socketManager.leaveRoom(
      SocketRooms.joinBooking(_currentBookingId!),
    );
    _currentBookingId = null;
  }

  @override
  Future<void> close() async {
    _chatSubscription?.cancel();
    _messageStatusSubscription?.cancel();
    _chatSubscription = null;
    _messageStatusSubscription = null;
    _leaveChatRoom();
    return super.close();
  }
}
