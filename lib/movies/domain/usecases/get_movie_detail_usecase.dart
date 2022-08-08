import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

import '../../../core/usecase/base_usecase.dart';

class GetMovieDetailUseCase
    extends BaseUseCase<MovieDetail, MovieDetailParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailParameter parameter) async {
    return await baseMoviesRepository.getMovieDetail(parameter);
  }
}

class MovieDetailParameter extends Equatable {
  final int id;
  const MovieDetailParameter({required this.id});

  @override
  List<Object?> get props => [id];
}
