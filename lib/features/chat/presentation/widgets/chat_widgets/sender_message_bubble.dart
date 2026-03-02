import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class SenderMessageBubble extends StatelessWidget {
  const SenderMessageBubble({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // message
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: constraints.maxWidth * 0.75,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Color(0xffF2930D),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          message,
                          style: AppTextStyles.poppinsRegular16.copyWith(
                            color: Colors.white,
                          ),
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

                const SizedBox(width: 12),

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
              ],
            ),

            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
