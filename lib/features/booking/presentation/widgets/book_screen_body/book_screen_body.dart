import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_screen_body/date_time_pick_card.dart';
import 'package:guide_me/features/booking/presentation/widgets/book_screen_body/pick_up_point_field.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_body/custom_range_slider_people.dart';

class BookScreenBody extends StatefulWidget {
  const BookScreenBody({super.key});

  @override
  State<BookScreenBody> createState() => _BookScreenBodyState();
}

class _BookScreenBodyState extends State<BookScreenBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(
            text: context.l10n.booking,
          ),
          SizedBox(
            height: size.height * 0.02375,
          ),
          const Center(child: DateTimePickCard()),
          SizedBox(
            height: size.height * 0.06,
          ),
          Center(
            child: PickUpPointField(
              text: context.l10n.pickup,
              icon: Icons.access_time,
            ),
          ),
          SizedBox(
            height: size.height * 0.03125,
          ),

          Center(
            child: PickUpPointField(
              text: context.l10n.addtional,
            ),
          ),
          SizedBox(
            height: size.height * 0.0475,
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.p),
            child: Text(
              context.l10n.numberofperson,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.natural6,
                fontSize: 19,
              ),
            ),
          ),
          const CustomRangeSliderPeople(),
          SizedBox(
            height: size.height * 0.0675,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: AppButton(
              onPressed: () {
                context.push(AppRoutes.bookInformationScreen);
              },
              text: context.l10n.apply,
              textStyle: AppTextStyles.interSemiBold18.copyWith(
                color: AppColors.white,
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.185,
          ),
        ],
      ),
    );
  }
}
