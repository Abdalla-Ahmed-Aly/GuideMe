import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.rate,
    required this.percent,
  });
  final int rate;
  final double percent;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          rate.toString(),
          style: AppTextStyles.poppinsRegular14,
        ),
        Expanded(
          child: LinearPercentIndicator(
            lineHeight: 10,
            percent: percent,
            backgroundColor: const Color(0xffFED59B),
            progressColor: const Color(0xffF2930D),
            barRadius: const Radius.circular(20),
          ),
        ),
        SizedBox(width: 3.w),
        Text(
          '${(percent * 100).toInt()}%',
          style: const TextStyle(
            color: Color(0xffFF9800),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
