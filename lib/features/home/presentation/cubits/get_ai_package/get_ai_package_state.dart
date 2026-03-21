import 'package:guide_me/features/home/domain/entity/package_entity.dart';

abstract class GetAiPackageState {}

class GetAiPackageInitial extends GetAiPackageState {}

class GetAiPackageLoading extends GetAiPackageState {}

class GetAiPackageSuccess extends GetAiPackageState {
  final List<PackageEntity> packages;

  GetAiPackageSuccess(this.packages);
}

class GetAiPackageFailure extends GetAiPackageState {
  final String message;

  GetAiPackageFailure(this.message);
}
