import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';

import '../../../core/usecase/base_usecase.dart';
import '../repository/base_movies_repository.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameter>{
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameter parameter)async {
    return await baseMoviesRepository.getRecommendationMovies(parameter);
  }
  
}
class RecommendationParameter extends Equatable{
  final int id;
  const RecommendationParameter({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props =>[id];


}