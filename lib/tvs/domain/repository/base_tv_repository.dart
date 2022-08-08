import 'package:dartz/dartz.dart';
import 'package:movies_app/tvs/domain/entities/tv_video.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_recommendation_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/tv_details.dart';
import '../entities/tv_recommendation.dart';
import '../entities/tvs.dart';
import '../usecases/get_tv_detail_usecase.dart';
import '../usecases/get_tv_video_usecase.dart';

abstract class BaseTvRepository {
  Future<Either<Failure, List<Tv>>> getNowPlayingTv();
  Future<Either<Failure, List<Tv>>> getPopularTv();
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
  Future<Either<Failure,TvDetail>>getTvDetail(TvDetailParameter parameter);
  Future<Either<Failure,List<TvRecommendation>>>getRecommendationTvs(TvRecommendationParameter parameter);
  Future<Either<Failure,TvVideo>>getTvVideo(TvVideoParameter parameter);
}
