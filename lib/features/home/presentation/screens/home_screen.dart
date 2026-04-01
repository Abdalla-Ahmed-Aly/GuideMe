import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_cubit.dart';
import 'package:guide_me/features/home/presentation/cubits/get_home_data/get_home_state.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_screen_body.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_screen_failure.dart';
import 'package:guide_me/features/home/presentation/widgets/home_widgets/home_screen_shimmer_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<GetHomeCubit, GetHomeState>(
        builder: (context, state) {
          if (state is GetHomeLoading) {
            return const HomeScreenShimmerLoading();
          } else if (state is GetHomeFailure) {
            final error = FailureUiMapper.map(context: context, failure: state.failure);
            return HomeScreenFailure(error: error);
          } else if (state is GetHomeSuccess) {
            final homeData = state.homeData;
            return HomeScreenBody(homeData: homeData);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
