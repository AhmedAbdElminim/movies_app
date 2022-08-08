import 'package:dio/dio.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/network/api_constant.dart';
import '../../../core/network/error_message_model.dart';
import '../../domain/entities/trending.dart';
import '../model/trending_model.dart';

abstract class BaseTrendingRemoteDataSource {
  Future<List<TrendingModel>> getTrending();
}

class TrendingRemoteDataSource extends BaseTrendingRemoteDataSource {
  @override
  Future<List<TrendingModel>> getTrending() async {
    final response = await Dio().get(ApiConstant.getTrendingPath);

    if (response.statusCode == 200) {
      return List<TrendingModel>.from((response.data['results'] as List)
          .map((e) => TrendingModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
