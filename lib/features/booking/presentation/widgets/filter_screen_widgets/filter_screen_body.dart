import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/custom_check_box.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/price_slider.dart';
import 'package:guide_me/features/booking/presentation/widgets/filter_screen_widgets/people_slider.dart';

class FilterScreenBody extends StatelessWidget {
  const FilterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 22),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: Text(
              context.l10n.price,
              style: TextStyle(
                fontFamily: AppTextStyles.familyMontserrat,
                fontWeight: FontWeight.w600,
                color: AppColors.natural6,
                fontSize: 16.fs,
              ),
            ),
          ),

          SizedBox(
            height: size.height * 0.01,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.p),
            child: const PriceSlider(),
          ),

          SizedBox(
            height: size.height * 0.020,
          ),

          Divider(
            height: 1,
            thickness: 4.0,
            indent: 30.p,
            endIndent: 30.p,
            color: const Color(0xFFE0E0E0),
          ),

          SizedBox(
            height: size.height * 0.020,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: Text(
              context.l10n.category,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.natural6,
                fontSize: 16,
              ),
            ),
          ),

          const CustomCheckBox(),

          SizedBox(
            height: size.height * 0.020,
          ),

          Divider(
            height: 1,
            thickness: 4.0,
            indent: 30.p,
            endIndent: 30.p,
            color: const Color(0xFFE0E0E0),
          ),

          SizedBox(
            height: size.height * 0.020,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: Text(
              context.l10n.numberofperson,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: AppColors.natural6,
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.p),
            child: const PeopleSlider(),
          ),

          SizedBox(
            height: size.height * 0.07,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.p),
            child: AppButton(
              onPressed: () {
                context.push(
                  AppRoutes.explorePlacesScreen,
                  extra: context.l10n.afterFilter,
                );
              },
              text: context.l10n.apply,
              textStyle: AppTextStyles.interSemiBold18.copyWith(
                color: AppColors.white,
              ),
            ),
          ),

          const SizedBox(height: 34),
        ],
      ),
    );
  }
}
