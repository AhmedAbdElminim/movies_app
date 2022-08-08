import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/trending/domain/entities/trending.dart';
import 'package:movies_app/trending/domain/repository/base_trending_repository.dart';

class GetTrendingUseCase extends BaseUseCase<List<Trending>, NoParameter> {
  final BaseTrendingRepository baseTrendingRepository;

  GetTrendingUseCase(this.baseTrendingRepository);

  @override
  Future<Either<Failure, List<Trending>>> call(NoParameter parameter) async {
    return await baseTrendingRepository.getTrending();
  }
}
