import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:guide_me/features/dashboard/domain/repo/analysis_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetAnalysisUseCase {
  final AnalysisRepo _analysisRepo;

  GetAnalysisUseCase(this._analysisRepo);

  Future<Either<Failure, AnalysisEntity>> call() async {
    return await _analysisRepo.getAnalysis();
  }
}
