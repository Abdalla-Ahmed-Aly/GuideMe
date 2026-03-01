import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';

class ChatStatusItem extends StatelessWidget {
  const ChatStatusItem({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffF2930D) : const Color(0xffF4EEE7),
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(
                  color: const Color(0xffC8C8C8).withValues(alpha: .4),
                )
              : null,
        ),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.poppinsMedium18.copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
