import 'package:guide_me/core/shared/models/user_info_model.dart';

class MessageModel {
  final String id;
  final String booking;
  final String conversationId;
  final UserInfoModel sender;
  final String? receiver;
  final String? message;
  final String? type;
  final bool isSeen;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool? isMine;

  MessageModel({
    required this.id,
    required this.booking,
    required this.conversationId,
    required this.sender,
    this.receiver,
    this.message,
    this.type,
    required this.isSeen,
    required this.createdAt,
    required this.updatedAt,
    this.isMine,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['_id'],
      booking: json['booking'],
      conversationId: json['conversationId'],
      sender: UserInfoModel.fromJson(json['sender']),
      receiver: json['receiver'],
      message: json['message'],
      type: json['type'],
      isSeen: json['isSeen'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isMine: json['isMine'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'booking': booking,
      'conversationId': conversationId,
      'sender': sender.toJson(),
      'receiver': receiver,
      'message': message,
      'type': type,
      'isSeen': isSeen,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isMine': isMine,
    };
  }
}
