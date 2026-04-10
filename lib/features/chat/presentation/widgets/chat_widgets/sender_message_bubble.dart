import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:intl/intl.dart';

class SenderMessageBubble extends StatelessWidget {
  const SenderMessageBubble({super.key, required this.message});
  final MessageEntity message;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // message
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: constraints.maxWidth * 0.75,
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xffF2930D),
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(16),
                    topRight: const Radius.circular(16),
                    bottomLeft: context.isEnglish
                        ? const Radius.circular(16)
                        : const Radius.circular(0),
                    bottomRight: context.isEnglish
                        ? const Radius.circular(0)
                        : const Radius.circular(16),
                  ),
                ),
                child: Text(
                  message.message,
                  style: AppTextStyles.poppinsRegular16.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            // time
            Text(
              DateFormat.jm().format(message.createdAt),
              style: AppTextStyles.poppinsRegular14.copyWith(
                color: const Color(0xff9C7A49),
              ),
            ),

            const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
