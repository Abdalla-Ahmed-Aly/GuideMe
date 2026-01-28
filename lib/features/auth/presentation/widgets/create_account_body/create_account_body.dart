import 'package:flutter/widgets.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_body/creat_account_ScrollView.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_body/create_account_accountdetails.dart';

class CreateAccountBody extends StatelessWidget {
  const CreateAccountBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(
          top: 45.p,
          left: 29.p,
          right: 28.p,
          bottom: 71.p,
        ),
        child: Container(
          width: 373.w,
          decoration: BoxDecoration(
            color: AppColors.natural7,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: Column(
            children: [
              77.verticalSpace,
              Image.asset(
                AppImages.guideMe,
                width: 254.w,
                height: 135.h,
              ),
              6.verticalSpace,
              Text(
                context.l10n.createAccount,
                style: AppTextStyles.poppinsBold32.copyWith(
                  color: AppColors.primary500,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 59.p, left: 10.p, right: 10.p),
                child: const CreatAccountscrollview(),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(right: 10.p, left: 10.p),
                child: AppButton(
                  onPressed: () {},
                  text: context.l10n.createAccount,
                ),
              ),
              SizedBox(height: 26.h),
              const CreateAccountAccountdetails(),
            ],
          ),
        ),
      ),
    );
  }
}
