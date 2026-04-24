import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/di/user_scope.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/tourist_nav_bar_cubit.dart';
import 'package:guide_me/features/profile/presentation/cubits/logout_cubit/logout_cubit.dart';

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
    final logoutCubit = context.read<LogoutCubit>();
    return showDialog(
      context: context,
      builder: (dialogContext) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: cubit,
            ),
            BlocProvider.value(
              value: logoutCubit,
            ),
          ],
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
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {
                        dialogContext.pop();
                      },
                      child: Text(context.l10n.cancel),
                    ),
                  ),

                  BlocConsumer<LogoutCubit, LogoutState>(
                    listener: (context, state) {
                      if (state is LogoutFailure) {
                        final error = FailureUiMapper.map(
                          context: context,
                          failure: state.failure,
                        );
                        context.showErrorSnakbar(message: error.message);
                      } else if (state is LogoutSuccess) {
                        _logout(cubit, context);
                      }
                    },
                    builder: (context, state) {
                      return Expanded(
                        child: AppButton(
                          isLoading: state is LogoutLoading,
                          loadWidth: context.screenWidth,
                          height: 38,
                          onPressed: () async {
                            await context.read<LogoutCubit>().logout();
                          },
                          text: context.l10n.logout,
                          backgroundColor: Colors.red,
                          textStyle: AppTextStyles.interSemiBold16.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _logout(TouristNavBarCubit cubit, BuildContext context) async {
    if (context.mounted) {
      context.read<TouristNavBarCubit>().reset();
      await context.read<UserCubit>().clearUser();
      await UserScope.disposeUserScope();

      context.go(AppRoutes.signupAndLoginScreen);
    }
  }
}
