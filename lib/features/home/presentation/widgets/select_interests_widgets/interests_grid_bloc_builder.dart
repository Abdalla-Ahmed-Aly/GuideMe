import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/features/home/presentation/cubits/interests_cubit/interests_cubit.dart';
import 'package:guide_me/features/home/presentation/widgets/select_interests_widgets/interests_grid_shimmer.dart';
import 'package:guide_me/features/home/presentation/widgets/select_interests_widgets/interests_grid_view.dart';

class InterestsGridBlocBuilder extends StatelessWidget {
  const InterestsGridBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InterestsCubit, InterestsState>(
      builder: (context, state) {
        if (state is GetInterestsSuccess || state.data.categoriesLoaded) {
          return InterestsGridView(categories: state.data.categories);
        } else if (state is GetInterestsFailure) {
          final error = FailureUiMapper.map(
            context: context,
            failure: state.failure,
          );
          return FailureMessageWidget(error: error.message);
        }
        return const InterestsGridShimmer();
      },
    );
  }
}
