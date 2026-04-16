import 'package:dartz/dartz.dart';
import 'package:guide_me/core/errors/error_handler.dart';
import 'package:guide_me/core/errors/failure.dart';
import 'package:guide_me/features/dashboard/data/data_source/analysis_remote_data_source.dart';
import 'package:guide_me/features/dashboard/data/mappers/analysis_mapper.dart';
import 'package:guide_me/features/dashboard/domain/entities/analysis_entity.dart';
import 'package:guide_me/features/dashboard/domain/repo/analysis_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AnalysisRepo)
class AnalysisRepoImple extends AnalysisRepo {
  final AnalysisRemoteDataSource remoteDataSource;

  AnalysisRepoImple(this.remoteDataSource);

  @override
  Future<Either<Failure, AnalysisEntity>> getAnalysis() async {
    try {
      final result = await remoteDataSource.getAnalysis();
      return Right(AnalysisMapper.toEntity(result));
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
