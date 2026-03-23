import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/auth/presentation/manager/select_nationality_cubit/select_nationality_cubit.dart';

class ApplyingNationalitySection extends StatelessWidget {
  const ApplyingNationalitySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectNationalityCubit, SelectNationalityState>(
      listener: (context, state) {
        if (state is SelectNationalitySuccess) {
          context.push(AppRoutes.allowLocationAccessScreen);
          context.read<SelectNationalityCubit>().resetState();
        }
        if (state is SelectNationalityFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          context.showErrorSnakbar(message: error.message);
          context.read<SelectNationalityCubit>().resetState();
        }
      },
      builder: (context, state) {
        return AppButton(
          isLoading: state is SelectNationalityLoading,
          onPressed: () {
            if (state.data.selectedNationality != null) {
              context.read<SelectNationalityCubit>().addNationality();
            } else {
              context.showErrorSnakbar(
                message: context.l10n.pleaseSelectNationality,
              );
            }
          },
          text: context.l10n.continueText,
        );
      },
    );
  }
}
