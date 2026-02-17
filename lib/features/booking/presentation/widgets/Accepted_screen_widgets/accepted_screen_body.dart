import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_lotties.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/Accepted_screen_widgets/up_coming_tour_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/close_button.dart';
import 'package:lottie/lottie.dart';

class AcceptedScreenBody extends StatelessWidget {
  const AcceptedScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 30.p),
            child: const CloseButtonwidget(),
          ),
          Center(
            child: Lottie.asset(
              AppLotties.checked,
              height: 140.h,
            ),
          ),

          Center(
            child: Text(
              context.l10n.bookingAccepted,
              style: AppTextStyles.poppinsMedium28,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 58.p),
            child: Text(
              context.l10n.successMassage,
              style: AppTextStyles.poppinsMedium14.copyWith(
                color: const Color(0xff8190A5),
                height: 1.5,
              ),
              // softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const UpComingTourCard(),
          SizedBox(
            height: 33.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: AppButton(
              onPressed: () {},
              text: 'View Schedule',
              radius: 50,

              backgroundColor: const Color(0xffF2930D),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ChatWithTourist(),
          const SizedBox(height: 74),
        ],
      ),
    );
  }
}

class ChatWithTourist extends StatelessWidget {
  const ChatWithTourist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.p),
      child: SizedBox(
        width: double.infinity,

        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xffEE3434)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(50),
            ),
            padding: const EdgeInsets.symmetric(vertical: 13),
          ),
          onPressed: () {},
          child: Text(
            context.l10n.chatwithtoUurist,
            style: TextStyle(
              fontSize: 16.fs,
              color: const Color(0xffF4A60E),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
