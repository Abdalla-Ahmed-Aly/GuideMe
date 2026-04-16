part of 'analysis_cubit.dart';

sealed class AnalysisCubitState {}

final class AnalysisCubitInitial extends AnalysisCubitState {}

final class AnalysisCubitLoading extends AnalysisCubitState {}

final class AnalysisCubitSuccess extends AnalysisCubitState {
  final AnalysisEntity analysisEntity;

  AnalysisCubitSuccess(this.analysisEntity);
}

final class AnalysisCubitFailure extends AnalysisCubitState {
  final Failure failure;
  AnalysisCubitFailure(this.failure);
}
