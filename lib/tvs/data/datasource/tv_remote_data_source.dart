import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constant.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/usecases/get_tv_detail_usecase.dart';
import '../../domain/usecases/get_tv_recommendation_usecase.dart';
import '../../domain/usecases/get_tv_video_usecase.dart';
import '../models/tv_detail_model.dart';
import '../models/tv_model.dart';
import '../models/tv_recommendation_model.dart';
import '../models/tv_video_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> getNowPlayingTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
  Future<TvDetailModel> getTvDetail(TvDetailParameter parameter);
  Future<List<TvRecommendationModel>> getTvRecommendation(
      TvRecommendationParameter parameter);
  Future<TvVideoModel> getTvVideo(TvVideoParameter parameter);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> getNowPlayingTv() async {
    final response = await Dio().get(ApiConstant.getNowPlayingTvPath);

    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    final response = await Dio().get(ApiConstant.getPopularTvPath);

    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    final response = await Dio().get(ApiConstant.getTopRatedTvPath);

    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailModel> getTvDetail(TvDetailParameter parameter) async {
    final response = await Dio().get(ApiConstant.getTvDetailPath(parameter.id));

    if (response.statusCode == 200) {
      return TvDetailModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvRecommendationModel>> getTvRecommendation(
      TvRecommendationParameter parameter) async {
    final response =
        await Dio().get(ApiConstant.getTvRecommendationPath(parameter.id));

    if (response.statusCode == 200) {
      return List<TvRecommendationModel>.from((response.data['results'] as List)
          .map((e) => TvRecommendationModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvVideoModel> getTvVideo(TvVideoParameter parameter) async {
    final response = await Dio().get(ApiConstant.getTvVideoPath(parameter.id));

    if (response.statusCode == 200) {
      return TvVideoModel.fromJson(response.data['results'].length>0?response.data['results'][0]:{'key':'4xse3TEU2ms'});
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
