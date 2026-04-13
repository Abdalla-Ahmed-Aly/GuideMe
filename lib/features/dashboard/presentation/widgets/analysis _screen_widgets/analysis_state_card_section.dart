import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/snake_bar_extentions.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Analysis_Cubit/analysis_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_state_card_item.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis_card_shimmer.dart';

class AnalysisStatCardSection extends StatelessWidget {
  const AnalysisStatCardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnalysisCubit, AnalysisCubitState>(
      builder: (context, state) {
        if (state is AnalysisCubitLoading) {
          return const AnalysisCardShimmer();
        }else if (state is AnalysisCubitSuccess){
          final data = state.analysisResponse.data;
          return  AnalysisStatCardItem(
          data: data
        );
        }
        return const SizedBox();
        //
      }, listener: (BuildContext context, AnalysisCubitState state) { 
        if (state is AnalysisCubitFailure){
          final failure = FailureUiMapper.map(context: context, failure: state.failure);
          context.showErrorSnakbar(message: failure.message);
        }
      },
    );
  }
}
