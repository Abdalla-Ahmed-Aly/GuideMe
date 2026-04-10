import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/shared/data_sources/profile_local_data_source.dart';
import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/core/shared/mapper/photo_mapper.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:guide_me/features/chat/domain/use_cases/get_all_chat_messages.dart';
import 'package:guide_me/features/chat/domain/use_cases/send_message_use_case.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._getAllChatMessagesUseCase, this._sendMessageUseCase)
    : super(ChatInitial());
  final GetAllChatMessagesUseCase _getAllChatMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  final List<MessageEntity> messages = [];

  void safeEmit(ChatState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAllChatMessages(String conversationId) async {
    safeEmit(ChatLoading());
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

    final optimisticMessage = MessageEntity(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
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
    );

    messages.add(optimisticMessage);
    safeEmit(ChatSuccess(List.from(messages)));

    final result = await _sendMessageUseCase(sendMessageModel);
    result.fold(
      (failure) {
        messages.remove(optimisticMessage);
        safeEmit(ChatFailure(failure));
      },
      (_) {
        safeEmit(ChatSuccess(List.from(messages)));
      },
    );
  }
}
