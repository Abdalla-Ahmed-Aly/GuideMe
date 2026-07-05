import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/features/chat/domain/enums/message_status.dart';

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
  final MessageStatus status;

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
    this.status = MessageStatus.sent,
  });

  MessageEntity copyWith({
    MessageStatus? status,
    bool? isMine,
    bool? isSeen,
  }) {
    return MessageEntity(
      id: id,
      booking: booking,
      conversationId: conversationId,
      sender: sender,
      receiver: receiver,
      message: message,
      type: type,
      isSeen: isSeen ?? this.isSeen,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isMine: isMine ?? this.isMine,
      status: status ?? this.status,
    );
  }
}
