import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';

class ConversationEntity {
  final String conversationId;
  final String bookingId;
  MessageEntity? lastMessage;
  String createdAt;
  final UserInfoEntity user;

  ConversationEntity({
    required this.conversationId,
    required this.bookingId,
    required this.lastMessage,
    required this.createdAt,
    required this.user,
  });
}