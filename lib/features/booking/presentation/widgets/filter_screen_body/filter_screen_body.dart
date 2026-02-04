import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/custom_appbar.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_body/custom_check_box.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_body/custom_range_slider.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_body/custom_range_slider_people.dart';

class FilterScreenBody extends StatefulWidget {
  const FilterScreenBody({super.key});

  @override
  State<FilterScreenBody> createState() => _FilterScreenBodyState();
}

class _FilterScreenBodyState extends State<FilterScreenBody> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbar(
            text: context.l10n.filter,
          ),
          SizedBox(height: size.height * 0.027),
          Padding(
            padding: EdgeInsets.only(left: 30.p),
            child: Text(
              context.l10n.price,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.natural6,
                fontSize: 19,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.0246,
          ),
          const CustomRangeSlider(),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
              vertical: size.width * 0.04,
            ),
            child: const Divider(
              height: 1,
              thickness: 4.0,
              indent: 1,
              endIndent: 1,
              color: Color(0xFFE0E0E0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.p),
            child: Text(
              context.l10n.catogry,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.natural6,
                fontSize: 19,
              ),
            ),
          ),
          const CustomCheckBox(),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.08,
              vertical: size.width * 0.04,
            ),
            child: const Divider(
              height: 1,
              thickness: 4.0,
              indent: 1,
              endIndent: 1,
              color: Color(0xFFE0E0E0),
            ),
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
            height: size.height * 0.09125,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: AppButton(
              onPressed: () {
                context.push(AppRoutes.bookscreen);
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
