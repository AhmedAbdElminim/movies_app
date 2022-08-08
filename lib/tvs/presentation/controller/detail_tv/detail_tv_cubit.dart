import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tvs/domain/entities/tv_details.dart';
import 'package:movies_app/tvs/domain/entities/tv_video.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_detail_usecase.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_recommendation_usecase.dart';
import 'package:movies_app/tvs/domain/usecases/get_tv_video_usecase.dart';

import '../../../domain/entities/tv_recommendation.dart';
import 'detail_tv_state.dart';

class TvDetailCubit extends Cubit<DetailTvStates> {
  TvDetailCubit(this.getTvRecommendationUseCase, this.getTvDetailUseCase,this.getTvVideoUseCase)
      : super(DetailTvInitialState());
  static TvDetailCubit get(context) => BlocProvider.of(context);
  final GetTvDetailUseCase getTvDetailUseCase;
  final GetTvRecommendationUseCase getTvRecommendationUseCase;
  final GetTvVideoUseCase getTvVideoUseCase;
  TvDetail? tvDetail;
  List<TvRecommendation> tvRecommendationList = [];

  ///GET DETAIL TV
  Future<void> getTvDetail({required int movieId}) async {
    emit(DetailTvLoadingState());
    final result = await getTvDetailUseCase(TvDetailParameter(id: movieId));
    result.fold((l) => emit(DetailTvErrorState(l.errorMessage)), (r) {
      tvDetail = r;
      emit(DetailTvSuccessState());
    });
  }

  ///GET RECOMMENDATION TV
  Future<void> getRecommendationTv({required int movieId}) async {
    emit(RecommendationTvLoadingState());
    final result = await getTvRecommendationUseCase(
        TvRecommendationParameter(id: movieId));
    result.fold((l) => emit(RecommendationTvErrorState(l.errorMessage)), (r) {
      for (var element in r) {
        if (element.backdropPath != '') {
          tvRecommendationList.add(element);
        }
      }
    });
    emit(RecommendationTvSuccessState());
  }
  //---------------------------------//
  TvVideo? video;
  Future<void> getTvVideo({required int movieId}) async {
    emit(VideoTvLoadingState());
    final result = await getTvVideoUseCase(TvVideoParameter(id: movieId));
    result.fold((l) => emit(DetailTvErrorState(l.errorMessage)), (r) {
      video = r;
      emit(VideoTvSuccessState());
    });
  }

}
