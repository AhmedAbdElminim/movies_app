import 'package:dartz/dartz.dart';

import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/tvs/data/datasource/tv_remote_data_source.dart';
import 'package:movies_app/tvs/domain/entities/tv_details.dart';
import 'package:movies_app/tvs/domain/entities/tv_recommendation.dart';
import 'package:movies_app/tvs/domain/entities/tv_video.dart';

import 'package:movies_app/tvs/domain/entities/tvs.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_detail_usecase.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_recommendation_usecase.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_video_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../domain/repository/base_tv_repository.dart';

class TvRepository extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepository(this.baseTvRemoteDataSource);

  @override
  Future<Either<Failure, List<Tv>>> getNowPlayingTv() async {
    final result = await baseTvRemoteDataSource.getNowPlayingTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    final result = await baseTvRemoteDataSource.getPopularTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    final result = await baseTvRemoteDataSource.getTopRatedTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendation>>> getRecommendationTvs(
      TvRecommendationParameter parameter) async {
    final result = await baseTvRemoteDataSource.getTvRecommendation(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetail>> getTvDetail(
      TvDetailParameter parameter) async {
    final result = await baseTvRemoteDataSource.getTvDetail(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvVideo>> getTvVideo(TvVideoParameter parameter) async{
    final result = await baseTvRemoteDataSource.getTvVideo(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
