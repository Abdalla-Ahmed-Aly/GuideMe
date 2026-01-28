import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/arrow_back_button.dart';
import 'package:guide_me/features/auth/presentation/widgets/choose_nationality_widgets/countries_list_view.dart';
import 'package:guide_me/features/auth/presentation/widgets/custom_text_field.dart';

class ChooseNationalityScreen extends StatelessWidget {
  const ChooseNationalityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          88.verticalSpace,

          Row(
            children: [
              40.horizontalSpace,
              const ArrowBackButton(),
            ],
          ),

          56.verticalSpace,

          Text(
            context.l10n.chooseNationality,
            style: AppTextStyles.poppinsBold30.copyWith(
              color: AppColors.primary500,
            ),
          ),

          28.verticalSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
            child: CustomTextField(
              hintText: context.l10n.search,
              suffixIcon: const Icon(
                Icons.search,
                color: AppColors.natural3,
              ),
            ),
          ),

          17.verticalSpace,

          SizedBox(
            height: 400.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.p),
              child: const CountriesListView(),
            ),
          ),

          70.verticalSpace,

          AppButton(
            onPressed: () {
              context.push(AppRoutes.allowLocationAccessScreen);
            },
            text: context.l10n.continueText,
            height: 54.h,
            width: 353.w,
          ),
        ],
      ),
    );
  }
}
