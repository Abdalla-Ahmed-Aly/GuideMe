import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/book_ai_package_cubit/book_ai_package_cubit.dart';

class PickupLocationSection extends StatelessWidget {
  const PickupLocationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final location = await context.push<String>(
          AppRoutes.pickLocationScreen,
        );
        if (location != null) {
          context.read<BookAiPackageCubit>().setLocation(location);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              context.l10n.pickup,
              style: AppTextStyles.poppinsMedium14,
            ),
          ),
          const SizedBox(height: 8),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary2.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.location_city_rounded,
                  color: AppColors.primary550,
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: BlocBuilder<BookAiPackageCubit, BookAiPackageState>(
                    builder: (context, state) {
                      return Text(
                        state.data.location ?? context.l10n.selectLocation,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.poppinsBold16.copyWith(
                          color: AppColors.primary550,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 4),

                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primary550,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
