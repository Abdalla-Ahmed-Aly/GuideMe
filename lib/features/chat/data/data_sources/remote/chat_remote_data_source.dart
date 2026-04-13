import 'package:guide_me/features/chat/data/models/conversation_model.dart';
import 'package:guide_me/features/chat/data/models/message_model.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';

abstract class ChatRemoteDataSource {
  Future<List<ConversationModel>> getAllConversations();
  Future<List<MessageModel>> getAllMessages(String conversationId);
  Future<void> sendMessage(SendMessageModel sendMessageModel);
}
