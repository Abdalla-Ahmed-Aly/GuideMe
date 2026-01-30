import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_images.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_widgets/create_account_section.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_widgets/create_account_footer.dart';

class CreateAccountBody extends StatefulWidget {
  const CreateAccountBody({super.key});

  @override
  State<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends State<CreateAccountBody> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.07,
            left: 28.p,
            right: 28.p,
            bottom: size.height * 0.05,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.natural7,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.05),

                // Image
                Image.asset(
                  AppImages.guideMe,
                  width: 254.w,
                  height: 135.h,
                ),

                const SizedBox(height: 6),
                Text(
                  context.l10n.createAccount,
                  style: AppTextStyles.poppinsBold32.copyWith(
                    color: AppColors.primary500,
                  ),
                ),

                (size.height * 0.04).verticalSpace,

                // Create Account Section
                Padding(
                  padding: EdgeInsets.only(left: 10.p, right: 10.p),
                  child: const CreateAccountSection(),
                ),

                SizedBox(height: size.height * 0.04),

                Padding(
                  padding: EdgeInsets.only(right: 10.p, left: 10.p),
                  child: AppButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        context.push(AppRoutes.chooseNationalityScreen);
                      }
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    },
                    text: context.l10n.createAccount,
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                const CreateAccountFooter(),

                (size.height * 0.03).verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
