
import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/models/analysis_response_model.dart';

abstract class AnalysisRepo {
  Future<Either<Failure, AnalysisResponse>> getAnalysis();

}