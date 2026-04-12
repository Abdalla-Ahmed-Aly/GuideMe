import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/auth/presentation/manager/location_access_cubit/location_access_cubit.dart';
import 'package:guide_me/core/services/hive_service.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:guide_me/core/constants/hive_constants.dart';

class AllowLocationAccessScreen extends StatelessWidget {
  const AllowLocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          211.verticalSpace,

          // Location Icon
          Container(
            padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 30.w),
            decoration: BoxDecoration(
              color: const Color(0xff747480).withValues(alpha: .18),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.location_on_rounded,
                color: AppColors.primary,
                size: 45.ic,
              ),
            ),
          ),

          32.verticalSpace,

          // Texts
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 75.p),
            child: Text(
              context.l10n.enablePreciseLocation,
              textAlign: TextAlign.center,
              style: AppTextStyles.poppinsBold30.copyWith(
                color: AppColors.primary500,
              ),
            ),
          ),

          16.verticalSpace,

          // Texts
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 75.p),
            child: Text(
              context.l10n.locationDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.fs,
                color: AppColors.natural1,
                fontFamily: AppTextStyles.familyInter,
              ),
            ),
          ),

          37.verticalSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
            child: const EnableLocationAccess(),
          ),

          34.verticalSpace,

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 104.p),
            child: Text(
              context.l10n.securityNote,
              textAlign: TextAlign.center,
              style: AppTextStyles.interRegular12.copyWith(
                color: AppColors.natural1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class EnableLocationAccess extends StatelessWidget {
  const EnableLocationAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationAccessCubit, LocationAccessState>(
      listener: (context, state) {
        if (state is LocationAccessSuccess) {
          // Clear progress as we are now moving to onboarding/home
          HiveHelper.put<String>(
            boxName: HiveConstants.signupProgressBox,
            key: HiveConstants.signupStepKey,
            data: 'onboarding-started',
          );
          
          final savedRole = HiveService.loadUserRole();
          if (savedRole == UserRole.tourist) {
            context.go(AppRoutes.selectInterestsScreen);
          } else if (savedRole == UserRole.guide) {
            context.go(AppRoutes.guideProfessionalInfoScreen);
          } else {
            context.go(AppRoutes.chooseRoleScreen);
          }
        } else if (state is LocationAccessFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          context.showErrorSnakbar(message: error.message);
        }
      },
      builder: (context, state) {
        return AppButton(
          isLoading: state is LocationAccessLoading,
          onPressed: () {
            context.read<LocationAccessCubit>().getCurrentLocation();
          },
          text: context.l10n.enable,
        );
      },
    );
  }
}
