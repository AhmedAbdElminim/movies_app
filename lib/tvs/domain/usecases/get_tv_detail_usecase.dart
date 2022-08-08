import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/tvs/domain/entities/tv_details.dart';
import 'package:movies_app/tvs/domain/repository/base_tv_repository.dart';

class GetTvDetailUseCase extends BaseUseCase<TvDetail,TvDetailParameter>{
  final BaseTvRepository baseTvRepository;

  GetTvDetailUseCase(this.baseTvRepository);

  @override
  Future<Either<Failure, TvDetail>> call(TvDetailParameter parameter)async {
   return await baseTvRepository.getTvDetail(parameter);
  }


}
class TvDetailParameter extends Equatable{
  final int id;

const  TvDetailParameter({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}