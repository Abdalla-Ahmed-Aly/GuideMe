import 'package:guide_me/core/shared/entities/user_info_entity.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';

class ConversationEntity {
  final String conversationId;
  final String bookingId;
  final MessageEntity? lastMessage;
  final String createdAt;
  final UserInfoEntity user;

  ConversationEntity({
    required this.conversationId,
    required this.bookingId,
    required this.lastMessage,
    required this.createdAt,
    required this.user,
  });

  ConversationEntity copyWith({
    String? conversationId,
    String? bookingId,
    MessageEntity? lastMessage,
    String? createdAt,
    UserInfoEntity? user,
  }) {
    return ConversationEntity(
      conversationId: conversationId ?? this.conversationId,
      bookingId: bookingId ?? this.bookingId,
      lastMessage: lastMessage ?? this.lastMessage,
      createdAt: createdAt ?? this.createdAt,
      user: user ?? this.user,
    );
  }
}