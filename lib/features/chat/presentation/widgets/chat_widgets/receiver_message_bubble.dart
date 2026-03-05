import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ReceiverMessageBubble extends StatelessWidget {
  const ReceiverMessageBubble({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // image
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xffFFA537)),
                    image: const DecorationImage(
                      image: AssetImage(AppImages.profileImageTest),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // message
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth * 0.75,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                          border: Border.all(
                            color: const Color(
                              0xff000000,
                            ).withValues(alpha: 0.1),
                          ),
                        ),
                        child: Text(
                          message,
                          style: AppTextStyles.poppinsRegular16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 4),

                    // time
                    Text(
                      "09:42 AM",
                      style: AppTextStyles.poppinsRegular16.copyWith(
                        color: const Color(0xff9C7A49),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
