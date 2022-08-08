import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/entities/video.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_video_usecase.dart';

import '../../../domain/entities/movie_detail.dart';
import '../movie_detail_recommendation_movie/movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit(
      this.getMovieDetailUseCase, this.getRecommendationMoviesUseCase,this.getVideoUseCase)
      : super(MovieDetailInitialState());

  static MovieDetailCubit get(context) => BlocProvider.of(context);

  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationMoviesUseCase getRecommendationMoviesUseCase;
  final GetVideoUseCase getVideoUseCase;
  MovieDetail? movieDetail;
  List<Recommendation> recommendationList = [];

  ///GET MOVIE DETAILS
  Future<void> getMovieDetail({required int movieId}) async {
    emit(GetMovieDetailUseCaseLoadingState());
    final result =
        await getMovieDetailUseCase(MovieDetailParameter(id: movieId));
    result.fold((l) => emit(GetMovieDetailUseCaseErrorState(l.errorMessage)),
        (r) {
      movieDetail = r;
      emit(GetMovieDetailUseCaseSuccessState());
    });
  }

  ///GET RECOMMENDATION MOVIES
  Future<void> getRecommendationMovies({required int movieId}) async {
    emit(GetRecommendationMoviesLoadingState());
    final result = await getRecommendationMoviesUseCase(
        RecommendationParameter(id: movieId));
    result.fold((l) => emit(GetRecommendationMoviesErrorState(l.errorMessage)),
        (r) {
      for (var element in r) {
        if (element.backdropPath != '') {
          recommendationList.add(element);
        }
      }
    });
    emit(GetRecommendationMoviesSuccessState());
  }

  //---------------------------------------------------------------------------------------//
  Video? video;
  Future<void> getMovieVideo({required int movieId}) async {
    emit(GetMovieVideoUseCaseLoadingState());
    final result =
    await getVideoUseCase(VideoParameter(id: movieId));
    result.fold((l) => emit(GetMovieVideoUseCaseErrorState(l.errorMessage)),
            (r) {
              video = r;
          emit(GetMovieVideoUseCaseSuccessState());
        });
  }


}
