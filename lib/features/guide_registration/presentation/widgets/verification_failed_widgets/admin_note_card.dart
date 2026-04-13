import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AdminNoteCard extends StatelessWidget {
  final String? reason;
  const AdminNoteCard({
    super.key,
    this.reason,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: const BoxDecoration(
        color: Color(0xffFAF7F2),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.chat_bubble,
                size: 20,
                color: Color(0xff9C7A49),
              ),
              const SizedBox(width: 8),
              Text(
                context.l10n.notesFromAdmin,
                style: AppTextStyles.poppinsSemiBold16,
              ),
            ],
          ),
    
          const SizedBox(height: 16),
    
          Text(
            reason ?? context.l10n.adminNoteMessage,
            style: AppTextStyles.poppinsLight14.copyWith(
              color: const Color(0xff9C7A49),
            ),
          ),
        ],
      ),
    );
  }
}
