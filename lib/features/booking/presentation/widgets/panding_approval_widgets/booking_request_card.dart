import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/estimated_earnings_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/requester_profile_header.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/trip_details_section.dart';

class BookingRequestCard extends StatelessWidget {
  const BookingRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bookingData = GoRouterState.of(context).extra as BookingEntity;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .10),
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const RequesterProfileHeaderSection(),

          const SizedBox(height: 24),

          TripDetailsSection(booking: bookingData),

          const SizedBox(height: 16),

          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: context.l10n.myTrip,
                      style: AppTextStyles.poppinsSemiBold14,
                    ),
                    TextSpan(
                      text: bookingData.place.title,
                      style: AppTextStyles.poppinsMedium14.copyWith(
                        color: const Color(0xff7C6965),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Divider(
            color: const Color(0xffFFA537).withValues(alpha: 0.3),
            thickness: 2.5,
          ),

          const SizedBox(height: 15),

          EstimatedEarningsSection(
            price: bookingData.totalPrice,
          ),
        ],
      ),
    );
  }
}
