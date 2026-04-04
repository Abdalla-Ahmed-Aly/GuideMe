import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/analysis_response_model.dart';
import 'package:guide_me/features/dashboard/domain/repo/analysis_repo.dart';

class GetAnalysisUseCase {
  final AnalysisRepo _analysisRepo;

  GetAnalysisUseCase(this._analysisRepo);

  Future<Either<Failure, AnalysisResponse>> call() async {
    return await _analysisRepo.getAnalysis();
  }
}
