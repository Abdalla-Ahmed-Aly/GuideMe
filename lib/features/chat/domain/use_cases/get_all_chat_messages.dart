import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:guide_me/features/chat/domain/repos/chat_repo.dart';

@LazySingleton()
class GetAllChatMessagesUseCase {
  final ChatRepo _chatRepo;
  GetAllChatMessagesUseCase(this._chatRepo);

  Future<Either<Failure, List<MessageEntity>>> call(String bookingId) async {
    return await _chatRepo.getAllMessages(bookingId);
  }
}