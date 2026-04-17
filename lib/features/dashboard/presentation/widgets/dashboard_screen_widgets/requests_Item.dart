import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/booking_action_buttons.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/tour_detail_card.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/dashboard_screen_widgets/user_info.dart';

class RequestsItem extends StatelessWidget {
  const RequestsItem({
    super.key,
    required this.requestModel,
  });
  final RequestEntity requestModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          AppRoutes.bookingRequestScreen,
          extra: requestModel,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: const Color(0xffFFE5BA)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UserInfo(requestModel.booking?.user.photo?.url),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        requestModel.booking?.user.name ??
                            context.l10n.unknownName,
                        style: AppTextStyles.poppinsMedium18,
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '\$${requestModel.booking?.totalPrice}',
                      style: AppTextStyles.poppinsMedium20.copyWith(
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      context.l10n.estimate,
                      style: AppTextStyles.poppinsMedium14.copyWith(
                        color: const Color(0xff936B24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TourDetailCard(
                requestModel: requestModel,
              ),
            ),

            const SizedBox(height: 14),

            BookingActionButtons(
              bookingId: requestModel.booking!.id,
            ),
          ],
        ),
      ),
    );
  }
}
