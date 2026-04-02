import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/di/injectable.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/services/token/token_service.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/tourist_nav_bar_cubit.dart';

class LogoutSection extends StatelessWidget {
  const LogoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {
        logoutDialog(context);
      },
      text: context.l10n.logout,
      backgroundColor: Colors.red,
    );
  }

  Future<void> logoutDialog(BuildContext context) {
    final cubit = context.read<TouristNavBarCubit>();
    return showDialog(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: cubit,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white,
            title: Text(
              context.l10n.logout,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(context.l10n.areYouSureToLogout),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black,
                ),
                onPressed: () {
                  dialogContext.pop();
                },
                child: Text(context.l10n.cancel),
              ),

              FittedBox(
                fit: BoxFit.scaleDown,
                child: AppButton(
                  width: context.isArabic ? 140 : 110,
                  height: 38,
                  onPressed: () async {
                    await HiveHelper.put<bool>(
                      boxName: HiveConstants.avatarBox,
                      key: HiveConstants.avatarKey,
                      data: false,
                    );
                    await HiveHelper.delete<UserRole>(
                      boxName: HiveConstants.userRoleBox,
                      key: HiveConstants.userRoleKey,
                    );
                    await HiveHelper.delete<String>(
                      boxName: HiveConstants.userBox,
                      key: HiveConstants.userKey,
                    );
                    await getIt<TokenService>().deleteToken();
                
                    if (dialogContext.mounted) {
                      cubit.reset();
                      dialogContext.go(AppRoutes.signupAndLoginScreen);
                    }
                  },
                  text: context.l10n.logout,
                  backgroundColor: Colors.red,
                  textStyle: AppTextStyles.interSemiBold16.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
