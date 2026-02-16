import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/Pending_approval_badge.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/estimated_earnings_section.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/trip_details_section.dart';

class UpComingTourCard extends StatelessWidget {
  const UpComingTourCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 31.p),
      decoration: BoxDecoration(
        color: const Color(0xffFFE5BA).withValues(alpha: .10),
        border: Border.all(color: const Color(0xffFFE5BA)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(left: 27, right: 60.p),
            child: PendingApprovalBadge(
              text: context.l10n.upcomingTour,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const UpcomingTourHeader(),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: CustomTripdetails(
              title: context.l10n.meetingPoint,
              value: 'Giza Pyramids Private Tour',
              pathicon: SvgPicture.asset(AppIcons.location),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: CustomTripdetails(
              title: context.l10n.date,
              value: 'Oct 24 , 2026 , 09:00 am',
              pathicon: SvgPicture.asset(AppIcons.date),
            ),
          ),
          const SizedBox(
            height: 8,
          ),

          const Padding(
            padding: EdgeInsets.only(left: 6),
            child: EstimatedEarningsSection(color: AppColors.white),
          ),
          const SizedBox(
            height: 36,
          ),
        ],
      ),
    );
  }
}

class UpcomingTourHeader extends StatelessWidget {
  const UpcomingTourHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: GestureDetector(
        onTap: () {
          context.push(AppRoutes.guideProfileScreen);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xffFFA537)),
                image: const DecorationImage(
                  image: AssetImage(AppImages.profileImageTest),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'omar yasser',
                    style: AppTextStyles.poppinsMedium18,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: AppColors.yellow,
                        size: 10,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        '4.9',
                        style: AppTextStyles.poppinsBold12.copyWith(
                          color: AppColors.yellow,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        '(12 tour)',
                        style: AppTextStyles.poppinsRegular14.copyWith(
                          color: const Color(0xff8794A4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
