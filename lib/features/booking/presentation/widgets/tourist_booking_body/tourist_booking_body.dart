import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_body/cancel_button_with_date.dart';
import 'package:guide_me/features/booking/presentation/widgets/tourist_booking_body/card_of_image.dart';

class TouristBookingBody extends StatelessWidget {
  const TouristBookingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(top: 32.p),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.p),
                    child: AppButton(
                      onPressed: () {},
                      text: context.l10n.upcomingBookings,

                      height: 48.h,
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 5.p),
                    child: AppButton(
                      onPressed: () {},
                      text: context.l10n.pastBookings,

                      height: 48.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 27.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.p),
              child: Text(
                context.l10n.todayBookings,
                style: AppTextStyles.poppinsSemiBold24.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            const CardOfImage(),

            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.p,
                    right: 198.p,
                    top: 5.p,
                  ),
                  child: Text(
                    context.l10n.santoriniIslnd,
                    style: AppTextStyles.interSemiBold16.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 11.p),
                  child: SvgPicture.asset(AppIcons.rate),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 12.p, right: 25.p, left: 40.p),
              child: Text(
                'Discover the Pyramids of Giza with a guided tour showcasing ancient history.',
                softWrap: true,
                maxLines: 2,
                style: AppTextStyles.interRegular10.copyWith(
                  color: AppColors.natural4,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.p, left: 40.p),
              child: Text(
                'Discover the Pyramids of Giza with a guided tour showcasing ancient history.',
                softWrap: true,
                maxLines: 2,
                style: AppTextStyles.interRegular10.copyWith(
                  color: AppColors.natural4,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 25.p, left: 40.p),
              child: Text(
                'Discover the Pyramids of Giza with a guided tour showcasing ancient history.',
                softWrap: true,
                maxLines: 2,
                style: AppTextStyles.interRegular10.copyWith(
                  color: AppColors.natural4,
                ),
              ),
            ),
            const CancelButtonWithDate(),
          ],
        ),
      ),
    );
  }
}
