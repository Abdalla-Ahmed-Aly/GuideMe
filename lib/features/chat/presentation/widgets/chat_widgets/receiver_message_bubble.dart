import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:intl/intl.dart';

class ReceiverMessageBubble extends StatelessWidget {
  const ReceiverMessageBubble({
    super.key,
    required this.message,
    required this.makeRaduis,
  });
  final MessageEntity message;
  final bool makeRaduis;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: context.isEnglish
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth * 0.75,
            ),
            child: Container(
              margin: EdgeInsets.only(top: makeRaduis ? 2 : 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: makeRaduis
                    ? BorderRadius.circular(16)
                    : BorderRadius.only(
                        topLeft: context.isEnglish
                            ? const Radius.circular(0)
                            : const Radius.circular(16),
                        topRight: context.isEnglish
                            ? const Radius.circular(16)
                            : const Radius.circular(0),
                        bottomRight: const Radius.circular(16),
                        bottomLeft: const Radius.circular(16),
                      ),
                border: Border.all(
                  color: const Color(
                    0xff000000,
                  ).withValues(alpha: 0.1),
                ),
              ),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.message,
                      style: AppTextStyles.poppinsRegular16,
                    ),

                    const SizedBox(height: 4),

                    // time and status
                    Align(
                      alignment: context.isEnglish
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Text(
                        DateFormat.jm().format(
                          message.createdAt.toLocal(),
                        ),
                        style: AppTextStyles.poppinsRegular14.copyWith(
                          color: const Color(0xff9C7A49),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
