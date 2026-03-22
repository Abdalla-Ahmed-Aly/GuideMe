import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/price_slider.dart';

class PriceRangeSection extends StatelessWidget {
  const PriceRangeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),

        Text(
          context.l10n.priceRange,
          style: AppTextStyles.poppinsBold20,
        ),

        const SizedBox(height: 16),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffF1F5F9)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              // Selected Range Price
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.l10n.priceRange,
                      style: AppTextStyles.interMedium16.copyWith(
                        color: const Color(0xff64748B),
                      ),
                    ),

                    BlocBuilder<FilterCubit, FilterState>(
                      builder: (context, state) {
                        final priceRange = state.filters.priceRange;
                        return Text(
                          "\$${priceRange.start.toInt()} - \$${priceRange.end.toInt()}",
                          style: AppTextStyles.interBold20.copyWith(
                            color: AppColors.primary2,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const PriceSlider(),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$10",
                      style: AppTextStyles.interRegular14.copyWith(
                        color: const Color(0xff94A3B8),
                      ),
                    ),
                    Text(
                      "\$1000",
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
  }
}
