import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class PendingApprovalBadge extends StatelessWidget {
  const PendingApprovalBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xffFFE5BA).withValues(alpha: .3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
          side: const BorderSide(color: Color(0xffFFE5BA)),
        ),
        minimumSize: const Size(208, 44),
      ),
      onPressed: () {},
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              height: 12,
              width: 12,
              decoration: const BoxDecoration(
                color: Color(0xFFF5C26C),
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(
            width: 13,
          ),
          Text(
            'Pending Approval',
            style: AppTextStyles.poppinsMedium16.copyWith(
              color: const Color(0xffF4A60E),
            ),
          ),
        ],
      ),
    );
  }
}
