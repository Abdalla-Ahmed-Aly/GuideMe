import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({
    super.key,
    required this.isSelected,
    required this.title,
    this.onTap,
  });
  final bool isSelected;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 300),
        scale: isSelected ? 1.05 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.poppinsMedium16.copyWith(
                color: isSelected
                    ? const Color(0xffF2930D)
                    : const Color(0xffB59A64),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
