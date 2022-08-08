abstract class MovieDetailState{}
class MovieDetailInitialState extends MovieDetailState{}

class GetMovieDetailUseCaseLoadingState extends MovieDetailState{}

class GetMovieDetailUseCaseSuccessState extends MovieDetailState{}
class GetMovieDetailUseCaseErrorState extends MovieDetailState{
  final String error;
  GetMovieDetailUseCaseErrorState(this.error);

}
class GetRecommendationMoviesLoadingState extends MovieDetailState{}
class GetRecommendationMoviesSuccessState extends MovieDetailState{}

class GetRecommendationMoviesErrorState extends MovieDetailState{
  final String error;
  GetRecommendationMoviesErrorState(this.error);

}
class GetMovieVideoUseCaseSuccessState extends MovieDetailState{}
class GetMovieVideoUseCaseLoadingState extends MovieDetailState{}
class GetMovieVideoUseCaseErrorState extends MovieDetailState{
  final String error;
  GetMovieVideoUseCaseErrorState(this.error);
}