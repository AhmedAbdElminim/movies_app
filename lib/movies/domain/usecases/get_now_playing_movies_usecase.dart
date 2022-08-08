import 'package:dartz/dartz.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/movies.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>,NoParameter> {
  BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);


  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
