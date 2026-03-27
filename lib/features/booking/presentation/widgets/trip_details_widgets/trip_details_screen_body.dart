import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/total_price_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/trip_details_grid_view_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/trip_details_header.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/meeting_point_section.dart';

class CompletedTripScreenBody extends StatelessWidget {
  const CompletedTripScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final booking = GoRouterState.of(context).extra as BookingEntity;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          if (booking.guider != null)
            CompletedTripHeader(guider: booking.guider!),

          const SizedBox(height: 22),

          TripDetailsGridViewSection(booking: booking),

          MeetingPointSection(location: booking.place.location!),

          const SizedBox(height: 20),

          Text(
            context.l10n.paymentSummary,
            style: AppTextStyles.poppinsSemiBold20,
          ),

          const SizedBox(height: 12),

          TotalPriceSection(totalPrice: booking.totalPrice),

          SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
        ],
      ),
    );
  }
}
