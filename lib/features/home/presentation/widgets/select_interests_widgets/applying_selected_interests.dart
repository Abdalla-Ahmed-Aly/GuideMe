import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/core/routes/app_routes.dart';
import 'package:guide_me/core/widgets/app_button.dart';
import 'package:guide_me/features/home/presentation/cubits/interests_cubit/interests_cubit.dart';

class ApplyingSelectedInterests extends StatelessWidget {
  const ApplyingSelectedInterests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InterestsCubit, InterestsState>(
      listener: (context, state) {
        if (state is AddInterestsFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          context.showErrorSnakbar(message: error.message);
        } else if (state is AddInterestsSuccess) {
          context.go(AppRoutes.touristNavigationBarScreen);
        }
      },
      builder: (context, state) {
        return AppButton(
          isLoading: state is AddInterestsLoading,
          onPressed: state.data.selectedCategories.isNotEmpty
              ? () {
                  context.read<InterestsCubit>().addInterests();
                }
              : null,
          text: context.l10n.continueText,
        );
      },
    );
  }
}
