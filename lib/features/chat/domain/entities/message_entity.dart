import 'package:guide_me/core/shared/entities/user_info_entity.dart';

class MessageEntity {
  final String id;
  final String booking;
  final String conversationId;
  final UserInfoEntity sender;
  final String receiver;
  final String message;
  final String type;
  final bool isSeen;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isMine;

  MessageEntity({
    required this.id,
    required this.booking,
    required this.conversationId,
    required this.sender,
    required this.receiver,
    required this.message,
    required this.type,
    required this.isSeen,
    required this.createdAt,
    required this.updatedAt,
    required this.isMine,
  });
}