import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/custom_network_image.dart';
import 'package:guide_me/features/booking/domain/entities/booking_entity.dart';
import 'package:intl/intl.dart';

class LiveTripCard extends StatelessWidget {
  const LiveTripCard({super.key, required this.booking});
  final BookingEntity booking;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRoutes.tripDetailsScreen, extra: booking);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: const Border(
            left: BorderSide(
              color: Color(0xffF2930D),
              width: 5,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: const Color(0xffDD7B03).withValues(alpha: .32),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Live now and Time
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Live now
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffFEF4E6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      context.l10n.liveNow,
                      style: AppTextStyles.poppinsMedium12.copyWith(
                        color: const Color(0xffF2930D),
                      ),
                    ),
                  ),

                  Text(
                    "${DateFormat("hh:mm a").format(booking.startTime)} - ${DateFormat("hh:mm a").format(booking.endTime)}",
                    style: AppTextStyles.poppinsMedium12.copyWith(
                      color: const Color(0xffF2930D),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              Text(
                booking.place.title,
                style: AppTextStyles.poppinsMedium18,
              ),

              const SizedBox(height: 5),

              Row(
                children: [
                  SvgPicture.asset(AppIcons.user),
                  const SizedBox(width: 5),
                  Text(
                    "${booking.user.name} & (${booking.persons})",
                    style: AppTextStyles.poppinsRegular14.copyWith(
                      color: const Color(0xffB59A64),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 6),

              _buildLiveTripImage(context),

              const SizedBox(height: 10),

              _buildCardButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            onPressed: () {
              showEndTourDialog(context);
            },
            text: context.l10n.endTour,
            height: 44.h,
            radius: 220,
            backgroundColor: const Color(0xffF2930D),
          ),
        ),

        const SizedBox(width: 18),

        Container(
          width: 40.w,
          height: 40.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffFEF4E6),
          ),
          child: const Center(
            child: Icon(
              Icons.chat_outlined,
              color: Color(0xffF2930D),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> showEndTourDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: const Color(0xffDD7B03).withValues(alpha: .32),
            ),
          ),
          title: Text(
            context.l10n.endTour,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(context.l10n.confirmEndTour),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                context.pop();
              },
              child: Text(context.l10n.cancel),
            ),
            AppButton(
              width: 120,
              height: 38,
              onPressed: () {
                context.pop();
              },
              text: context.l10n.endTour,
              backgroundColor: Colors.red,
              textStyle: AppTextStyles.interSemiBold16.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        );
      },
    );
  }

  // Image & Track Button
  Widget _buildLiveTripImage(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffDD7B03).withValues(alpha: .32),
          strokeAlign: BorderSide.strokeAlignOutside,
        ),
      ),
      // Button
      child: Stack(
        children: [
          // image
          CustomNetworkImage(
            imageUrl: booking.place.images.first,
            fit: BoxFit.cover,
            width: double.infinity,
          ),

          // track button
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffFDFDFD),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.map_outlined,
                    color: Colors.grey,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    context.l10n.trackLiveLocation,
                    style: AppTextStyles.poppinsMedium16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
