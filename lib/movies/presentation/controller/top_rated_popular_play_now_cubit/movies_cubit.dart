import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';

import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_popular_play_now_cubit/movies_states.dart';

import '../../../domain/entities/movies.dart';
import '../../../domain/usecases/get_popular_movies_usecase.dart';

class MoviesCubit extends Cubit<MoviesStates> {
  MoviesCubit(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUsCase)
      : super(MoviesInitialState());
  static MoviesCubit get(context) => BlocProvider.of(context);
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetTopRatedMoviesUsCase getTopRatedMoviesUsCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  List<Movie> nowPlayMoviesList = [];
  List<Movie> popularMoviesList = [];
  List<Movie> topRatedMoviesList = [];

  ///GET NOW PLAY MOVIES
  void getNowPlayMovies() async {
    emit(GetNowPlayingMoviesUseCaseLoadingState());
    final result = await getNowPlayingMoviesUseCase(const NoParameter());
    result.fold(
        (l) => emit(GetNowPlayingMoviesUseCaseErrorState(l.errorMessage)), (r) {
      nowPlayMoviesList = r;
    });
    emit(GetNowPlayingMoviesUseCaseSuccessesState());
  }

  ///GET POPULAR MOVIES
  void getPopularMovies() async {
    emit(GetPopularMoviesUseCaseLoadingState());
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold((l) => emit(GetPopularMoviesUseCaseErrorState(l.errorMessage)),
        (r) {
      popularMoviesList = r;
    });
    emit(GetPopularMoviesUseCaseSuccessesState());
  }

  ///GET TOP RATED MOVIES
  void getTopRatedMovies() async {
    emit(GetTopRatedMoviesUseCaseLoadingState());
    final result = await getTopRatedMoviesUsCase(const NoParameter());
    result.fold((l) => emit(GetTopRatedMoviesUseCaseErrorState(l.errorMessage)),
        (r) {
      topRatedMoviesList = r;
    });
    emit(GetTopRatedMoviesUseCaseSuccessesState());
  }
}
