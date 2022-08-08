import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/tvs/domain/repository/base_tv_repository.dart';

import '../entities/tv_recommendation.dart';

class GetTvRecommendationUseCase
    extends BaseUseCase<List<TvRecommendation>, TvRecommendationParameter> {
  final BaseTvRepository baseTvRepository;

  GetTvRecommendationUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, List<TvRecommendation>>> call(
      TvRecommendationParameter parameter) async {
    return await baseTvRepository.getRecommendationTvs(parameter);
  }
}

class TvRecommendationParameter extends Equatable {
  final int id;

  const TvRecommendationParameter({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
