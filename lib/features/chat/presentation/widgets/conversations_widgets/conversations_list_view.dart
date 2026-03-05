import 'package:flutter/material.dart';
import 'package:guide_me/features/chat/presentation/widgets/conversations_widgets/conversation_card.dart';

class ConversationsListView extends StatelessWidget {
  const ConversationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemBuilder: (context, index) {
        return const ConversationCard();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 16);
      },
      itemCount: 10,
    );
  }
}
