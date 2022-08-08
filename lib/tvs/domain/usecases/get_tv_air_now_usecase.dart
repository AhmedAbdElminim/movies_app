import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/tvs/domain/repository/base_tv_repository.dart';

import '../entities/tvs.dart';

class GetNowPlayTvUseCase extends BaseUseCase<List<Tv>, NoParameter> {
  BaseTvRepository baseTvRepository;
  GetNowPlayTvUseCase(this.baseTvRepository);
  @override
  Future<Either<Failure, List<Tv>>> call(NoParameter parameter) async {
    return await baseTvRepository.getNowPlayingTv();
  }
}
