import 'package:flutter/material.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/estimated_earnings_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/requester_profile_header.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/trip_details_section.dart';

class BookingRequestCard extends StatelessWidget {
  const BookingRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.p),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFFE5BA).withValues(alpha: .10),
          border: Border.all(color: const Color(0xffFFE5BA)),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            const RequesterProfileHeaderSection(),
            const SizedBox(
              height: 32,
            ),
            const TripDetailsSection(),
            const SizedBox(
              height: 17,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 31),
              child: Row(
                children: [
                  Text(
                    'My Trip :',
                    style: AppTextStyles.poppinsSemiBold14,
                  ),
                  Text(
                    'Giza Plateau Great Pyramids',
                    style: AppTextStyles.poppinsMedium14.copyWith(
                      color: const Color(0xff7C6965),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 17,
            ),
            Divider(
              color: const Color(0xffFFA537).withValues(alpha: 0.3),
              thickness: 2.5, //
              indent: 35, //
              endIndent: 35, //
            ),
            const SizedBox(
              height: 15,
            ),
            const EstimatedEarningsSection(),
            SizedBox(
              height: 29.h,
            ),
          ],
        ),
      ),
    );
  }
}
