import 'package:guide_me/core/shared/models/user_info_model.dart';
import 'package:guide_me/features/chat/data/models/message_model.dart';

class ConversationModel {
  final String? conversationId;
  final String? bookingId;
  final MessageModel? lastMessage;
  final String? createdAt;
  final UserInfoModel userModel;

  ConversationModel({
    required this.conversationId,
    required this.bookingId,
    required this.lastMessage,
    required this.createdAt,
    required this.userModel,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      conversationId: json['conversationId'],
      bookingId: json['bookingId'],
      lastMessage: json['lastMessage'] != null
          ? MessageModel.fromJson(json['lastMessage'])
          : null,
      createdAt: json['createdAt'],
      userModel: UserInfoModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'bookingId': bookingId,
      'lastMessage': lastMessage?.toJson(),
      'createdAt': createdAt,
      'user': userModel.toJson(),
    };
  }
}
