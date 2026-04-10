import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/chat/domain/entities/message_entity.dart';
import 'package:intl/intl.dart';

class SenderMessageBubble extends StatelessWidget {
  const SenderMessageBubble({
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
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: constraints.maxWidth * 0.9,
            ),
            child: Container(
              margin: EdgeInsets.only(top: makeRaduis ? 2 : 8),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xffF2930D),
                borderRadius: makeRaduis
                    ? BorderRadius.circular(16)
                    : BorderRadius.only(
                        topLeft: context.isEnglish
                            ? const Radius.circular(16)
                            : const Radius.circular(0),
                        topRight: context.isEnglish
                            ? const Radius.circular(0)
                            : const Radius.circular(16),
                        bottomLeft: const Radius.circular(16),
                        bottomRight: const Radius.circular(16),
                      ),
              ),
              child: IntrinsicWidth(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.message,
                      style: AppTextStyles.poppinsRegular16.copyWith(
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // time and status
                    Align(
                      alignment: context.isEnglish
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateFormat.jm().format(message.createdAt),
                            style: AppTextStyles.poppinsRegular14.copyWith(
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.done_all_rounded,
                            color: Colors.white.withValues(alpha: 0.7),
                            size: 18,
                          ),
                        ],
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
