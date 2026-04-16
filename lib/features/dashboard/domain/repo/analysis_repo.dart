
import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/analysis_entity.dart';

abstract class AnalysisRepo {
  Future<Either<Failure, AnalysisEntity>> getAnalysis();

}