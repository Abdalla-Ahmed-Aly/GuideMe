import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/Accepted_screen_widgets/up_coming_tour_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/panding_approval_widgets/close_button.dart';

class AcceptedScreenBody extends StatelessWidget {
  const AcceptedScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.h,
          ),
          const CloseButtonwidget(),
          const Center(
            child: CircleAvatar(
              radius: 55,
              backgroundColor: Color(0xffD4F3DF),
              child: CircleAvatar(
                backgroundColor: Color(0xff22C55E),
                radius: 39,
                child: Icon(
                  FontAwesomeIcons.check,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              'Booking Accepted',
              style: AppTextStyles.poppinsMedium28,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.only(left: 80.p, right: 58.p),
            child: Text(
              'Your booking has been successfully accepted. You can now communicate with  the tourist and prepare for the tour.',
              style: AppTextStyles.poppinsMedium14.copyWith(
                color: const Color(0xff8190A5),
                height: 1.5,
              ),
              softWrap: true,
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
          const CHATWITHTOURIST(),
        ],
      ),
    );
  }
}

class CHATWITHTOURIST extends StatelessWidget {
  const CHATWITHTOURIST({
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
              color: const Color(0xffEE3434),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
