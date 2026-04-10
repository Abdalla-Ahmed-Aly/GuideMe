import 'package:guide_me/core/shared/entities/user_entity.dart';

class ConversationEntity {
  final String conversationId;
  final String bookingId;
  final String lastMessage;
  final String createdAt;
  final UserEntity user;

  ConversationEntity({
    required this.conversationId,
    required this.bookingId,
    required this.lastMessage,
    required this.createdAt,
    required this.user,
  });
}