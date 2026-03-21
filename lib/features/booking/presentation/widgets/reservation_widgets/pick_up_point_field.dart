import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/cubits/reservation_cubit/reservation_cubit.dart';

class PickUpPointField extends StatelessWidget {
  const PickUpPointField({super.key});

  @override
  Widget build(BuildContext context) {
    final reservationCubit = context.read<ReservationCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 34.p),
      child: GestureDetector(
        onTap: () async {
          final location = await context.push<String>(
            AppRoutes.pickLocationScreen,
          );
          if (location != null) {
            reservationCubit.setPickupLocation(location);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.natural2.withValues(alpha: 0.6),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                Icons.my_location,
                color: AppColors.primary2,
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Text(
                  context.watch<ReservationCubit>().state.pickupLocation ??
                      context.l10n.pickup,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.interBold14.copyWith(
                    color: AppColors.natural3,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.primary2,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
