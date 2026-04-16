import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure_ui_mapper.dart';
import 'package:guide_me/core/extentions/context_extentions.dart';
import 'package:guide_me/core/styles/app_text_styles.dart';
import 'package:guide_me/core/widgets/failure_message_widget.dart';
import 'package:guide_me/features/dashboard/presentation/cubits/Analysis_Cubit/analysis_cubit.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_screen_section.dart';
import 'package:guide_me/features/dashboard/presentation/widgets/analysis%20_screen_widgets/analysis_screen_shimmer_loading.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.analysis,
          style: AppTextStyles.poppinsSemiBold20,
        ),
      ),
      body: BlocBuilder<AnalysisCubit, AnalysisCubitState>(
        builder: (context, state) {
          if (state is AnalysisCubitSuccess) {
            return AnalysisScreenBody(analysis: state.analysisEntity);
          } else if (state is AnalysisCubitFailure) {
            final error = FailureUiMapper.map(
              context: context,
              failure: state.failure,
            );
            return FailureMessageWidget(error: error.message);
          }
          return const AnalysisScreenShimmerLoading();
        },
      ),
    );
  }
}
