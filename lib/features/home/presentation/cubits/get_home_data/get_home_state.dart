import 'package:guide_me/features/home/domain/entity/home_entity.dart';

abstract class GetHomeState {}

class GetHomeInitial extends GetHomeState {}

class GetHomeLoading extends GetHomeState {}

class GetHomeSuccess extends GetHomeState {
  final HomeEntity homeData;
  GetHomeSuccess(this.homeData);
}

class GetHomeFailure extends GetHomeState {
  final String errorMessage;
  GetHomeFailure(this.errorMessage);
}
