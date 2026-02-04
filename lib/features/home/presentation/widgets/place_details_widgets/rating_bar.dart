import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    super.key,
    required this.number,
    required this.value,
  });
  final int number;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$number",
          style: TextStyle(
            fontSize: 12.fs,
            fontWeight: FontWeight.w300,
          ),
        ),

        const SizedBox(width: 4),

        Icon(
          Icons.star_rounded,
          size: 18.ic,
          color: const Color(0xffFFDA44),
        ),

        const SizedBox(width: 4),

        Expanded(
          child: LinearProgressIndicator(
            value: value,
            color: AppColors.yellow,
            backgroundColor: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            minHeight: 7.h,
          ),
        ),
      ],
    );
  }
}
