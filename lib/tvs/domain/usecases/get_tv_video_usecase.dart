import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import '../entities/tv_video.dart';
import '../repository/base_tv_repository.dart';

class GetTvVideoUseCase extends BaseUseCase<TvVideo, TvVideoParameter> {
  final BaseTvRepository baseTvRepository;

  GetTvVideoUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, TvVideo>> call(TvVideoParameter parameter) async {
    return await baseTvRepository.getTvVideo(parameter);
  }
}

class TvVideoParameter extends Equatable {
  final int id;

  const TvVideoParameter({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
