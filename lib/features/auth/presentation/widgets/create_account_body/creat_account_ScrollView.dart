import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/features/auth/presentation/widgets/create_account_body/create_account_textfield.dart';

class CreatAccountscrollview extends StatelessWidget {
  const CreatAccountscrollview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CreateAccountTextfield(hintText: context.l10n.name),
          SizedBox(height: 20.h),
          CreateAccountTextfield(hintText: context.l10n.email),
          SizedBox(height: 20.h),
          CreateAccountTextfield(
            hintText: context.l10n.password,
            obscureText: true,
            suffixIcon: Padding(
              padding:  EdgeInsets.all(15.p),
              child: SvgPicture.asset(AppIcons.hidePassword ,),
            ),
          ),
          SizedBox(height: 20.h),
          CreateAccountTextfield(
            hintText: context.l10n.confirmPassword,
            obscureText: true,
            suffixIcon: Padding(
              padding:  EdgeInsets.all(15.p),
              child: SvgPicture.asset( AppIcons.hidePassword , width: 13.w , height: 8.h),
            ),
          ),
        ],
      ),
    );
  }
}
