import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/video.dart';

import '../repository/base_movies_repository.dart';

class GetVideoUseCase extends BaseUseCase<Video, VideoParameter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetVideoUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, Video>> call(VideoParameter parameter) async {
    return await baseMoviesRepository.getMovieVideo(parameter);
  }
}

class VideoParameter extends Equatable {
  final int id;
  const VideoParameter({required this.id});

  @override
  List<Object?> get props => [id];
}
