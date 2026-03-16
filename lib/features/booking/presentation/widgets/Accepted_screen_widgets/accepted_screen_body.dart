import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_lotties.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/booking/presentation/widgets/Accepted_screen_widgets/accepted_screen_buttons.dart';
import 'package:guide_me/features/booking/presentation/widgets/Accepted_screen_widgets/up_coming_tour_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/close_button.dart';
import 'package:lottie/lottie.dart';

class AcceptedScreenBody extends StatelessWidget {
  const AcceptedScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.p),
        child: Column(
          children: [
            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: context.screenHeight * 0.045),
                Center(
                  child: Lottie.asset(
                    AppLotties.checked,
                    height: 140.h,
                  ),
                ),
                const CloseButtonwidget(),
              ],
            ),

            Text(
              context.l10n.bookingAccepted,
              style: AppTextStyles.poppinsMedium28,
            ),

            const SizedBox(height: 14),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.p),
              child: Text(
                context.l10n.successMassage,
                style: AppTextStyles.poppinsMedium14.copyWith(
                  color: const Color(0xff8190A5),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 24),

            const UpcomingTourCard(),

            const SizedBox(height: 32),

            const AcceptedScreenButtons(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
