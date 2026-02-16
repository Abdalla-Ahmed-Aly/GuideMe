import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PendingApprovalBadge extends StatelessWidget {
  const PendingApprovalBadge({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208,
      height: 33,
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffFFE5BA)),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: CircleAvatar(
              radius: 6,
              backgroundColor: Color(0xFFF5C26C),
            ),
          ),
          const SizedBox(width: 13),
          Text(
            text,
            style: AppTextStyles.poppinsMedium16.copyWith(
              color: const Color(0xffF4A60E),
            ),
          ),
        ],
      ),
    );
  }
}
