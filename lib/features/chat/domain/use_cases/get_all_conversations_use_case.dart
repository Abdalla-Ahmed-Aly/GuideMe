import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';
import 'package:guide_me/features/chat/domain/repos/chat_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetAllConversationsUseCase {
  final ChatRepo _chatRepo;
  GetAllConversationsUseCase(this._chatRepo);

  Future<Either<Failure, List<ConversationEntity>>> call() async =>
      await _chatRepo.getAllConversations();
}
