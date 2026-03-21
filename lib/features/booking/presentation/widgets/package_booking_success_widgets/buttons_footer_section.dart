import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/core/widgets/app_outlined_button.dart';
import 'package:guide_me/features/home/presentation/cubits/nav_bar_cubit/tourist_nav_bar_cubit.dart';

class ButtonsFooterSection extends StatelessWidget {
  const ButtonsFooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final navBarCubit = context.read<TouristNavBarCubit>();
    return Container(
      padding: EdgeInsets.only(
        top: 16,
        left: 24.p,
        right: 24.p,
        bottom: MediaQuery.of(context).padding.bottom + 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: AppColors.primary2.withValues(alpha: 0.05),
            blurRadius: 32,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        children: [
          AppButton(
            onPressed: () {
              navBarCubit.changeIndex(1);
              context.go(AppRoutes.touristNavigationBarScreen);
            },
            text: context.l10n.viewBookingsDetails,
            backgroundColor: AppColors.primary2,
            textStyle: AppTextStyles.poppinsMedium16.copyWith(
              color: Colors.white,
            ),
            radius: 16,
            height: 48,
          ),

          const SizedBox(height: 16),

          AppOutlinedButton(
            onPressed: () {
              navBarCubit.changeIndex(0);
              context.go(AppRoutes.touristNavigationBarScreen);
            },
            text: context.l10n.backToHome,
            borderColor: AppColors.primary2,
            textStyle: AppTextStyles.poppinsMedium16.copyWith(
              color: AppColors.primary2,
            ),  
            radius: 16,
          ),
        ],
      ),
    );
  }
}
