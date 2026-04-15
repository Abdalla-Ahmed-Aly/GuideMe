import 'package:flutter/material.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/trip_details_widgets/meeting_point_section.dart';
import 'package:guide_me/features/dashboard/domain/entities/request_entity.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/booking_details_%20request_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/earnings_summary_card.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/booking_request_screen_widgets/tourist_profile_image.dart';

class BookingRequestSection extends StatelessWidget {
  const BookingRequestSection({super.key, required this.requestEntity});
  final RequestEntity requestEntity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),

          Center(
            child: TouristProfileImage(
              imageUrl: requestEntity.booking?.user.photo?.url,
            ),
          ),

          const SizedBox(height: 8),

          Center(
            child: Text(
              requestEntity.booking?.user.name ?? context.l10n.unknownName,
              style: AppTextStyles.poppinsRegular18,
            ),
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.only(left: 23),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.professionalInformation,
                style: AppTextStyles.poppinsSemiBold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: BookingDetailsRequestSection(
              requestEntity: requestEntity,
            ),
          ),

          const SizedBox(height: 20),

          if (requestEntity.booking?.place.location != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.p),
              child: MeetingPointSection(
                location: requestEntity.booking!.place.location!,
              ),
            ),

          const SizedBox(height: 24),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.l10n.paymentSummary,
                style: AppTextStyles.poppinsSemiBold20.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.p),
            child: EarningsSummaryCard(
              totalAmount: requestEntity.booking?.place.price ?? 0,
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
