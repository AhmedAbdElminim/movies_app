import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import '../../../domain/entities/tvs.dart';
import '../../../domain/usecases/get_popular_tv_usecase.dart';
import '../../../domain/usecases/get_toprated_tv_usecase.dart';
import '../../../domain/usecases/get_tv_air_now_usecase.dart';
import 'main_tv_state.dart';

class TvCubit extends Cubit<TvStates> {
  TvCubit(this.getPopularTvUseCase,this.getTopRatedTvUseCase,this.getNowPlayTvUseCase)
      : super(TvsInitialState());
  static TvCubit get(context) => BlocProvider.of(context);
  final GetNowPlayTvUseCase getNowPlayTvUseCase;
  final GetTopRatedTvUseCase getTopRatedTvUseCase;
  final GetPopularTvUseCase getPopularTvUseCase;
  List<Tv> nowPlayTvsList = [];
  List<Tv> popularTvsList = [];
  List<Tv> topRatedTvsList = [];

  ///GET NOW PLAY MOVIES
  void getNowPlayMovies() async {
    emit(GetNowPlayingTvsUseCaseLoadingState());
    final result = await getNowPlayTvUseCase(const NoParameter());
    result.fold((l) => emit(GetNowPlayingTvsUseCaseErrorState(l.errorMessage)),
        (r) {
      r.forEach((element) {
        if(element.backdropPath!=''){
          nowPlayTvsList.add(element);
        }
      });
      //nowPlayTvsList = r;
    });
    emit(GetNowPlayingTvsUseCaseSuccessesState());
  }

  ///GET POPULAR MOVIES
  void getPopularTvs() async {
    emit(GetPopularTvsUseCaseLoadingState());
    final result = await getPopularTvUseCase(const NoParameter());
    print(result);
    result.fold((l) => emit(GetPopularTvsUseCaseErrorState(l.errorMessage)),
        (r) {
          r.forEach((element) {
            if(element.backdropPath!=''){
              popularTvsList.add(element);
            }
          });
      //popularTvsList = r;
    });
    emit(GetPopularTvsUseCaseSuccessesState());
  }

  ///GET TOP RATED MOVIES
  void getTopRatedTvs() async {
    emit(GetTopRatedTvsUseCaseLoadingState());
    final result = await getTopRatedTvUseCase(const NoParameter());
    result.fold((l) => emit(GetTopRatedTvsUseCaseErrorState(l.errorMessage)),
        (r) {
          r.forEach((element) {
            if(element.backdropPath!=''){
              topRatedTvsList.add(element);
            }
          });
     // topRatedTvsList = r;
    });
    emit(GetTopRatedTvsUseCaseSuccessesState());
  }
}
