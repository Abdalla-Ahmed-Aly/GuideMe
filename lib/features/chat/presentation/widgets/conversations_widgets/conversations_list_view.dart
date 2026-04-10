import 'package:flutter/material.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';
import 'package:guide_me/features/chat/presentation/widgets/conversations_widgets/conversation_card.dart';

class ConversationsListView extends StatelessWidget {
  const ConversationsListView({super.key, required this.conversations});
  final List<ConversationEntity> conversations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 16),
      itemBuilder: (context, index) {
        return ConversationCard(conversation: conversations[index]);
      },
      itemCount: conversations.length,
    );
  }
}
