import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/args/chat_args.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/domain/entities/conversation_entity.dart';
import 'package:guide_me/features/chat/presentation/widgets/conversations_widgets/conversation_user_image.dart';
import 'package:intl/intl.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({super.key, required this.conversation});
  final ConversationEntity conversation;

  @override
  Widget build(BuildContext context) {
    final isSeen =
        conversation.lastMessage?.isSeen == true ||
        conversation.lastMessage?.isMine == true;
    return GestureDetector(
      onTap: () {
        final args = ChatArgs(
          conversationId: conversation.conversationId,
          bookingId: conversation.bookingId,
          user: conversation.user,
        );
        context.push(AppRoutes.chatScreen, extra: args);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: isSeen ? Colors.white : const Color(0xffFBF0E0),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xffF2930D).withValues(alpha: .47),
          ),
        ),
        child: Row(
          children: [
            ConversationUserImage(
              user: conversation.user,
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.user.name,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.poppinsSemiBold20,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        DateFormat("jm").format(
                          DateTime.parse(conversation.createdAt).toLocal(),
                        ), // TODO: change it to 5m ago or 1 hour later
                        style: AppTextStyles.poppinsMedium14.copyWith(
                          color: const Color(0xffF2930D),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessage?.message ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.poppinsRegular14.copyWith(
                            fontWeight: isSeen
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                        ),
                      ),

                      if (!isSeen) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffF2930D),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            context.l10n.newText,
                            style: AppTextStyles.poppinsMedium12.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
