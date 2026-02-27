import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';

class VerificationDocumentCard extends StatelessWidget {
  const VerificationDocumentCard({
    super.key,
    required this.title,
    required this.hint,
    required this.svgIcon,
  });
  final String title;
  final String hint;
  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DottedBorder(
          options: const RoundedRectDottedBorderOptions(
            color: Color(0xffE8D8C4),
            strokeWidth: 4,
            dashPattern: [5, 5],
            radius: Radius.circular(20),
            borderPadding: EdgeInsets.all(2),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffFEF4E6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SvgPicture.asset(
                      svgIcon,
                      width: 26,
                      height: 26,
                      colorFilter: const ColorFilter.mode(
                        Color(0xffF2930D),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.fs,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  hint,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xffA38354),
                    fontSize: 14.fs,
                  ),
                ),
              ],
            ),
          ),
        ),

        // plus icon
        Positioned(
          top: 16,
          right: 13,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: const BoxDecoration(
              color: Color(0xffF2930D),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
