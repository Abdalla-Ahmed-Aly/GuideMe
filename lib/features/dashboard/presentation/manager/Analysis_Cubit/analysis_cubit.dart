import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/analysis_response_model.dart';
import 'package:guide_me/features/dashboard/domain/use_case/get_analysis_use_case%20.dart';
import 'package:injectable/injectable.dart';

part 'analysis_cubit_state.dart';

@injectable
class AnalysisCubit extends Cubit<AnalysisCubitState> {
  AnalysisCubit(this.getAnalysisUseCase) : super(AnalysisCubitInitial());
  final GetAnalysisUseCase getAnalysisUseCase;
  void safeEmit(AnalysisCubitState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getAnalysis() async {
    safeEmit(AnalysisCubitLoading());
    final result = await getAnalysisUseCase.call();
    result.fold(
      (failure) {
        safeEmit(AnalysisCubitFailure(failure));
      },
      (data) {
        safeEmit(AnalysisCubitSuccess(data));
      },
    );
  }
}
