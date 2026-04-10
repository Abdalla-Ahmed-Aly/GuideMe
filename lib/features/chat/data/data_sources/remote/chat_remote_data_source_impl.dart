import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/features/chat/data/data_sources/remote/chat_remote_data_source.dart';
import 'package:guide_me/features/chat/data/models/conversation_model.dart';
import 'package:guide_me/features/chat/data/models/message_model.dart';
import 'package:guide_me/features/chat/data/models/send_message_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final ApiService _apiService;

  ChatRemoteDataSourceImpl(this._apiService);

  @override
  Future<List<ConversationModel>> getAllConversations() async {
    final response = await _apiService.get(
      endpoint: ApiConstants.getAllConversationsEndpoint,
    );
    return (response.data['data']['conversations'] as List)
        .map((e) => ConversationModel.fromJson(e))
        .toList();
  }

  @override
  Future<List<MessageModel>> getAllMessages(String conversationId)async {

    final response = await _apiService.get(
      endpoint: "${ApiConstants.chatEndpoint}/$conversationId",
    );
    return (response.data['data']['messages'] as List)
        .map((e) => MessageModel.fromJson(e))
        .toList();
  }

  @override
  Future<void> sendMessage(SendMessageModel sendMessageModel)  async{
    await _apiService.post(
      endpoint: ApiConstants.sendMessageEndpoint,
      data: sendMessageModel.toJson(),
    );
  }
}
