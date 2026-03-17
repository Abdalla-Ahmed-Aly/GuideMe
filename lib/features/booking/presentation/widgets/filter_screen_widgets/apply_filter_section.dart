import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_code.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/responsive/reponsive_extention.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/booking/presentation/cubits/filter_cubit/filter_cubit.dart';

class ApplyFilterSection extends StatelessWidget {
  const ApplyFilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.p, vertical: 8),
      child: BlocConsumer<FilterCubit, FilterState>(
        listener: (context, state) {
          if (state is FilterApplyFailure) {
            String? error = state.failure.message;
            if (state.failure.failureCode != FailureCode.validation) {
              error = FailureUiMapper.map(
                context: context,
                failure: state.failure,
              ).message;
            }
            context.showErrorSnakbar(
              message: error ?? context.l10n.errorUnknown,
            );

            context.read<FilterCubit>().resetFailure();
          } else if (state is FilterApplied) {
            context.push(
              AppRoutes.suggestedPackagesScreen,
              extra: state.packages,
            );
          }
        },
        builder: (context, state) {
          return AppButton(
            isLoading: state is FilterApplying,
            onPressed: () {
              if (context.read<FilterCubit>().validate(context)) {
                context.read<FilterCubit>().getSuggestionPackages();
              }
            },
            text: context.l10n.apply,
            textStyle: AppTextStyles.poppinsSemiBold18,
          );
        },
      ),
    );
  }
}
