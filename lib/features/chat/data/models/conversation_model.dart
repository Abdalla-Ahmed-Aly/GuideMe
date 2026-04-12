import 'package:guide_me/core/shared/models/user_info_model.dart';

class ConversationModel {
  final String? conversationId;
  final String? bookingId;
  final String? lastMessage;
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
      lastMessage: json['lastMessage'],
      createdAt: json['createdAt'],
      userModel: UserInfoModel.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'bookingId': bookingId,
      'lastMessage': lastMessage,
      'createdAt': createdAt,
      'user': userModel.toJson(),
    };
  }
}
