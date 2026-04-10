import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:guide_me/features/chat/domain/repos/chat_repo.dart';

@LazySingleton()
class SendMessageUseCase {
  final ChatRepo _chatRepo;
  SendMessageUseCase(this._chatRepo);

  Future<Either<Failure, void>> call(SendMessageModel sendMessageModel) async {
    return await _chatRepo.sendMessage(sendMessageModel);
  }
}