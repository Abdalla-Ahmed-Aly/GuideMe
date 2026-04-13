import 'package:flutter/material.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';

class RoleSelectionCard extends StatelessWidget {
  final UserRole role;
  final bool isSelected;
  final VoidCallback onTap;
  final String title;
  final IconData icon;

  const RoleSelectionCard({
    super.key,
    required this.role,
    required this.isSelected,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary100 : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary500 : AppColors.natural3,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary500.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            // Container(
            //   padding: const EdgeInsets.all(12),
            //   decoration: BoxDecoration(
            //     color: isSelected ? AppColors.primary500 : AppColors.natural2,
            //     shape: BoxShape.circle,
            //   ),
            //   child: Icon(
            //     icon,
            //     color: isSelected ? Colors.white : AppColors.natural5,
            //     size: 24.p,
            //   ),
            // ),
            // const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.poppinsMedium16.copyWith(
                  color: isSelected ? AppColors.primary900 : AppColors.natural1,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                size: 26,
                Icons.check_circle,
                color: AppColors.primary500,
              )
            else
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.natural3, width: 2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
