import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/chat/data/data_sources/remote/chat_remote_data_source.dart';
import 'package:guide_me/features/chat/data/mappers/conversation_mapper.dart';
import 'package:guide_me/features/chat/data/mappers/message_mapper.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:guide_me/features/chat/domain/repos/chat_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRepo)
class ChatRepoImpl implements ChatRepo {
  final ChatRemoteDataSource _chatRemoteDataSource;
  ChatRepoImpl(this._chatRemoteDataSource);

  @override
  Future<Either<Failure, List<ConversationEntity>>>
  getAllConversations() async {
    try {
      final response = await _chatRemoteDataSource.getAllConversations();
      return Right(
        response.map((e) => ConversationMapper.toEntity(e)).toList(),
      );
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getAllMessages(
    String conversationId,
  ) async {
    try {
      final response = await _chatRemoteDataSource.getAllMessages(conversationId);
      return right(
        response.map((e) => MessageMapper.mapToEntity(e)).toList(),
      );
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, void>> sendMessage(
    SendMessageModel sendMessageModel,
  ) async {
    try {
      await _chatRemoteDataSource.sendMessage(sendMessageModel);
      return right(null);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
