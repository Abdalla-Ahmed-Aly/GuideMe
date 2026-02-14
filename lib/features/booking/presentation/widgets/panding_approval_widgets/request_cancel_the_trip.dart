import 'package:flutter/material.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';


class RequestCancelTheTrip extends StatelessWidget {
  const RequestCancelTheTrip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.p),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CircleAvatar(
                radius: 66,
                backgroundColor: const Color(0xffFBEFDF),
                child: Image.asset(AppImages.close),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Cancel Booking Request?',
              style: AppTextStyles.poppinsSemiBold26,
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.p),
              child: Text(
                'Your request is still pending approval. Are you sure you want to cancel this booking request?',
                style: AppTextStyles.poppinsLight20.copyWith(
                  color: const Color(0xff9C7A49),
                ),
                softWrap: true,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.p),
              child: AppButton(
                onPressed: () {},
                text: context.l10n.yesCancelRequest,
                radius: 17,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 18,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.p),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xffF2930D)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                  ),
                  onPressed: () {},
                  child: Text(
                    context.l10n.goBack,
                    style: AppTextStyles.poppinsSemiBold16.copyWith(
                      color: const Color(0xffFFAA00),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
