import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_ai_package_cubit/book_ai_package_cubit.dart';

class EnterNumberOfPersonsSection extends StatelessWidget {
  const EnterNumberOfPersonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BookAiPackageCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            context.l10n.numberofperson,
            style: AppTextStyles.poppinsMedium14,
          ),
        ),
        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primary2.withValues(alpha: .15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.people_alt_outlined,
                color: AppColors.primary550,
              ),

              const SizedBox(width: 12),

              Expanded(
                child: BlocBuilder<BookAiPackageCubit, BookAiPackageState>(
                  builder: (context, state) {
                    return Text(
                      state.data.numberOfPersons.toString(),
                      style: AppTextStyles.poppinsBold16.copyWith(
                        color: AppColors.primary550,
                      ),
                    );
                  },
                ),
              ),

              _IncresAndDecresButton(
                icon: Icons.remove,
                isEnabled:
                    context
                        .watch<BookAiPackageCubit>()
                        .state
                        .data
                        .numberOfPersons >
                    1,
                onTap: () {
                  cubit.setNumberOfPersons(
                    cubit.state.data.numberOfPersons - 1,
                  );
                },
              ),

              const SizedBox(width: 8),

              _IncresAndDecresButton(
                icon: Icons.add,
                isEnabled:
                    context
                        .watch<BookAiPackageCubit>()
                        .state
                        .data
                        .numberOfPersons <
                    10,
                onTap: () {
                  cubit.setNumberOfPersons(
                    cubit.state.data.numberOfPersons + 1,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IncresAndDecresButton extends StatelessWidget {
  const _IncresAndDecresButton({
    required this.icon,
    required this.onTap,
    required this.isEnabled,
  });
  final IconData icon;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColors.primary2.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isEnabled
              ? AppColors.primary550
              : AppColors.primary550.withValues(alpha: 0.5),
          size: 22,
        ),
      ),
    );
  }
}
