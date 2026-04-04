import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/data_source/analysis_remote_data_source.dart';
import 'package:guide_me/features/dashboard/data/models/Analysis_model/analysis_response_model.dart';
import 'package:guide_me/features/dashboard/domain/repo/analysis_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AnalysisRepo)
class AnalysisRepoImple extends AnalysisRepo {
  final AnalysisRemoteDataSource analysisRepoImple;

  AnalysisRepoImple(this.analysisRepoImple);

  @override
  Future<Either<Failure, AnalysisResponse>> getAnalysis() async {
    try {
      final result = await analysisRepoImple.getAnalysis();
      return Right(result);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
