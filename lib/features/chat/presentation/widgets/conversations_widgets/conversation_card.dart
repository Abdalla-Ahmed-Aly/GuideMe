import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/presentation/widgets/conversations_widgets/conversation_user_image_and_status.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.chatScreen);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: const Color(0xffFBF0E0),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xffF2930D).withValues(alpha: .47),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ConversationUserImageAndStatus(),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'John Doe',
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.poppinsSemiBold20,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Text(
                        '2m ago',
                        style: AppTextStyles.poppinsMedium14.copyWith(
                          color: const Color(0xffF2930D),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Hello, how are you? Hello, how are you? Hello, how are you?',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.poppinsRegular14,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF2930D),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xffD7D7D7),
                          ),
                        ),
                        child: Text(
                          context.l10n.live,
                          style: AppTextStyles.poppinsMedium14.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Text(
                        "Giza Plateau Exploration",
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.poppinsRegular14.copyWith(
                          color: const Color(0xffBA9F76),
                        ),
                      ),
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
