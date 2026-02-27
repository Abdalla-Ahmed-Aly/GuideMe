import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class VerificationDocumentTile extends StatelessWidget {
  const VerificationDocumentTile({
    super.key,
    required this.svgIcon,
    required this.title,
  });
  final String svgIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Color(0xffE7F8F2),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            svgIcon,
            // width: 30,
            height: 30,
            colorFilter: const ColorFilter.mode(
              Color(0xff00B87E),
              BlendMode.srcIn,
            ),
          ),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Text(
            title,
            style: AppTextStyles.poppinsLight20,
          ),
        ),

        const SizedBox(width: 16),

        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xffE7F8F2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check,
                color: Color(0xff00B87E),
              ),

              const SizedBox(width: 6),

              Text(
                context.l10n.submitted,
                style: AppTextStyles.poppinsLight16.copyWith(
                  color: const Color(0xff00B87E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
