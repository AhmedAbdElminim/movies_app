import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/trending/data/datasource/trending_remote_data_source.dart';
import 'package:movies_app/trending/domain/entities/trending.dart';
import 'package:movies_app/trending/domain/repository/base_trending_repository.dart';

import '../../../core/error/exceptions.dart';

class TrendingRepository extends BaseTrendingRepository {
  final BaseTrendingRemoteDataSource baseTrendingRemoteDataSource;

  TrendingRepository(this.baseTrendingRemoteDataSource);

  @override
  Future<Either<Failure, List<Trending>>> getTrending() async {
    final result = await baseTrendingRemoteDataSource.getTrending();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
