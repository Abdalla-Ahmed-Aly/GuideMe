import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:guide_me/core/shared/entities/user_entity.dart';
import 'package:guide_me/core/styles/app_colors.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/guide_profile/presentation/cubits/add_certification_cubit/add_certification_cubit.dart';

class AddingCertificateSection extends StatelessWidget {
  const AddingCertificateSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = GoRouterState.of(context).extra as UserEntity;
    final cubit = context.read<AddCertificationCubit>();
    final userCubit = context.read<UserCubit>();
    return BlocConsumer<AddCertificationCubit, AddCertificationState>(
      listener: (context, state) {
        if (state is AddCertificationSuccess) {
          userCubit.updateUser(state.user);
          context.showSuccessSnakbar(
            message: context.l10n.certificationAddedSuccessfully,
          );
          context.pop();
        } else if (state is AddCertificationFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          context.showErrorSnakbar(message: error.message);
        }
      },
      builder: (context, state) {
        return AppButton(
          isLoading: state is AddCertificationLoading,
          text: context.l10n.addCertification,
          onPressed: () {
            if (cubit.validateCertificationForm()) {
              cubit.addCertification(
                userId: user.id,
              );
            } else {
              context.showErrorSnakbar(
                message: context.l10n.pleaseFillAllFields,
              );
            }
          },
          radius: 20,
          backgroundColor: AppColors.primary2,
        );
      },
    );
  }
}
