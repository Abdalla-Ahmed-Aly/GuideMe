import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart';

class SelectNumberOfPersonsSection extends StatelessWidget {
  const SelectNumberOfPersonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final persons = state.filters.persons;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.numberofperson,
              style: AppTextStyles.poppinsSemiBold20,
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffF1F5F9)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IncrementAndDecrementButton(
                        icon: Icons.remove,
                        onTap: () {
                          context.read<FilterCubit>().setPersons(persons - 1);
                        },
                        isDisable: persons == 1,
                      ),

                      Column(
                        children: [
                          Text(
                            "$persons",
                            style: AppTextStyles.interBold36,
                          ),
                          Text(
                            context.l10n.persons,
                            style: AppTextStyles.interMedium14.copyWith(
                              color: const Color(0xff94A3B8),
                            ),
                          ),
                        ],
                      ),

                      IncrementAndDecrementButton(
                        icon: Icons.add,
                        onTap: () {
                          context.read<FilterCubit>().setPersons(persons + 1);
                        },
                        isDisable: persons == 10,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Slider(
                    value: persons.toDouble(),
                    onChanged: (value) {
                      context.read<FilterCubit>().setPersons(value.toInt());
                    },
                    min: 1,
                    max: 10,
                    activeColor: AppColors.primary2,
                    inactiveColor: const Color(0xffE2E8F0),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),

                  const SizedBox(height: 8),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "1",
                          style: AppTextStyles.interRegular14.copyWith(
                            color: const Color(0xff94A3B8),
                          ),
                        ),
                        Text(
                          "10",
                          style: AppTextStyles.interRegular14.copyWith(
                            color: const Color(0xff94A3B8),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class IncrementAndDecrementButton extends StatelessWidget {
  const IncrementAndDecrementButton({
    super.key,
    required this.icon,
    this.onTap,
    required this.isDisable,
  });
  final IconData icon;
  final void Function()? onTap;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisable ? null : onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffF1F5F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: isDisable ? Colors.grey.shade400 : AppColors.primary2,
        ),
      ),
    );
  }
}
