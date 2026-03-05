import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class BookingDetailsRequestItem extends StatelessWidget {
  const BookingDetailsRequestItem({
    super.key,
    required this.title,
    required this.value,
    required this.pathicon,
    required this.value1,
  });

  final String title;
  final String value;
  final String value1;
  final Widget pathicon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 13),
            decoration: BoxDecoration(
              color: const Color(0xffFEF4E6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: pathicon,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: AppTextStyles.poppinsSemiBold14.copyWith(
              color: const Color(0xff8B94A2),
            ),
          ),
          Text(
            value,
            style: AppTextStyles.poppinsMedium16,
          ),
          Text(
            value1,
            style: AppTextStyles.poppinsRegular14.copyWith(
              color: const Color(0xff956B00),
            ),
          ),
        ],
      ),
    );
  }
}
