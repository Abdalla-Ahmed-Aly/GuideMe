part of 'guide_data_cubit.dart';

sealed class GuideDataState {}

final class GuideDataInitial extends GuideDataState {}

final class GuideDataLoading extends GuideDataState {}

final class GuideDataSuccess extends GuideDataState {
  final GuideDetailsEntity guide;

  GuideDataSuccess(this.guide);
}

final class GuideDataFailure extends GuideDataState {
  final Failure failure;

  GuideDataFailure(this.failure);
}
