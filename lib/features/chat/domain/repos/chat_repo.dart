import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<ConversationEntity>>> getAllConversations();
  Future<Either<Failure, List<MessageEntity>>> getAllMessages(String conversationId);
  Future<Either<Failure, void>> sendMessage(SendMessageModel sendMessageModel);
}