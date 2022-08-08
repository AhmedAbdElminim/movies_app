import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/video.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';

import '../entities/recommendation.dart';
import '../usecases/get_video_usecase.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>>getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>>getPopularMovies();
  Future<Either<Failure,List<Movie>>>getTopRatedMovies();
  Future<Either<Failure,MovieDetail>>getMovieDetail(MovieDetailParameter parameter);
  Future<Either<Failure,List<Recommendation>>>getRecommendationMovies(RecommendationParameter parameter);
  Future<Either<Failure,Video>>getMovieVideo(VideoParameter parameter);

}