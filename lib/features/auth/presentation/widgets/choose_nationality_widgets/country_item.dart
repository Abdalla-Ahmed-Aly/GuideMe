import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/auth/domain/entities/nationality_entity.dart';

class CountryItem extends StatelessWidget {
  const CountryItem({
    super.key,
    this.isSelected = false,
    required this.country,
  });
  final bool isSelected;
  final NationalityEntity country;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.m, right: 10.m, bottom: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xffF4F5F6) : Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: isSelected ? AppColors.natural2 : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              country.emoji,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          8.horizontalSpace,
          Text(
            country.name,
            style: AppTextStyles.interMedium16,
          ),
          const Spacer(),
          isSelected
              ? Container(
                  padding: const EdgeInsets.all(7),
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 14,
                      color: AppColors.white,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
