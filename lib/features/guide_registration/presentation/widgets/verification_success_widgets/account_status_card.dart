import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class AccountStatusCard extends StatelessWidget {
  const AccountStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(
            0xff7B7B7B,
          ).withValues(alpha: .3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffFEF4E6),
            ),
            child: const Icon(
              Icons.check_circle,
              color: Color(0xffF2930D),
            ),
          ),
    
          const SizedBox(width: 16),
    
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.accountStatus,
                  style: AppTextStyles.poppinsSemiBold16
                      .copyWith(
                        color: const Color(0xffA6A6A6),
                      ),
                ),
    
                const SizedBox(height: 6),
    
                Text(
                  "${context.l10n.statusLabel} ${context.l10n.statusActive}",
                  style: AppTextStyles.poppinsSemiBold16,
                ),
              ],
            ),
          ),
    
          Container(
            height: 12,
            width: 12,
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
            ),
            decoration: const BoxDecoration(
              color: Color(0xff00D828),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
