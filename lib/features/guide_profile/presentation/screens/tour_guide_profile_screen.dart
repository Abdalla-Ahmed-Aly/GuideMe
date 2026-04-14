import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/app_assets/app_icons.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/features/guide_profile/presentation/widgets/tour_guide_widgets/tour_guide_profile_body.dart';

class TourGuideProfileScreen extends StatelessWidget {
  const TourGuideProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          context.l10n.profile,
          style: AppTextStyles.poppinsSemiBold24,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              AppIcons.settings,
              width: 24,
            ),
            onPressed: () {
              context.push(AppRoutes.settingsScreen);
            },
          ),
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return TourGuideProfileBody(user: state.user);
          } else if (state is UserFailure) {
            final error = FailureUiMapper.map(
              context: context,
              failure:
                  state.failure ??
                  const AppFailure(failureCode: FailureCode.unknown),
            );
            return FailureMessageWidget(error: error.message);
          }
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary2,
            ),
          );
        },
      ),
    );
  }
}
