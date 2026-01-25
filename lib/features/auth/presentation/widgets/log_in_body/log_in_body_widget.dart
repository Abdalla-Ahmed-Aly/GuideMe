import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_body/create_account_textfield.dart';

class LogInBodyWidget extends StatelessWidget {
  const LogInBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 20.p,
            right: 270.p,
            top: 145.p,
            bottom: 41.p,
          ),
          child: Text(
            context.l10n.login,
            style: AppTextStyles.poppinsBold30.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(left: 20.p, right: 260.p, top: 41.p),
          child: const Text(
            "Email address",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        CreateAccountTextfield(
          hintText: context.l10n.email,
          labelText: context.l10n.email,
          suffixIcon: SvgPicture.asset(AppIcons.correct),
        ),
      ],
    );
  }
}
