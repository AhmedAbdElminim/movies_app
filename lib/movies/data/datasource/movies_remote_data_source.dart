import 'package:dio/dio.dart';
import 'package:movies_app/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_usecase.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constant.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_recommendation_usecase.dart';
import '../../domain/usecases/get_video_usecase.dart';
import '../models/video_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetail(MovieDetailParameter parameter);
  Future<List<RecommendationModel>> getMovieRecommendation(
      RecommendationParameter parameter);
  Future<VideoModel> getMovieVideo(VideoParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstant.getNowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstant.getPopularMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstant.getTopRatedMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailModel> getMovieDetail(
      MovieDetailParameter parameter) async {
    final response =
        await Dio().get(ApiConstant.getMovieDetailPath(parameter.id));

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getMovieRecommendation(
      RecommendationParameter parameter) async {
    final response =
        await Dio().get(ApiConstant.getMovieRecommendationPath(parameter.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from((response.data['results'] as List)
          .map((e) => RecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<VideoModel> getMovieVideo(VideoParameter parameter) async {
    final response =
        await Dio().get(ApiConstant.getMovieVideoPath(parameter.id));

    if (response.statusCode == 200) {
      return VideoModel.fromJson(response.data['results'][0]);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
