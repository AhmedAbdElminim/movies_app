import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movies.dart';

class GetTopRatedMoviesUsCase extends BaseUseCase<List<Movie>,NoParameter > {
  BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUsCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesRepository.getTopRatedMovies();
  }
}
