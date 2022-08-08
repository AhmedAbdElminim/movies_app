
abstract class MoviesStates {}

class MoviesInitialState extends MoviesStates {}

class GetNowPlayingMoviesUseCaseLoadingState extends MoviesStates {}

class GetNowPlayingMoviesUseCaseErrorState extends MoviesStates {
  final String error;
  GetNowPlayingMoviesUseCaseErrorState(this.error);
}

class GetNowPlayingMoviesUseCaseSuccessesState extends MoviesStates {}

class GetPopularMoviesUseCaseLoadingState extends MoviesStates {}

class GetPopularMoviesUseCaseErrorState extends MoviesStates {
  final String error;
  GetPopularMoviesUseCaseErrorState(this.error);
}

class GetPopularMoviesUseCaseSuccessesState extends MoviesStates {}

class GetTopRatedMoviesUseCaseLoadingState extends MoviesStates {}

class GetTopRatedMoviesUseCaseErrorState extends MoviesStates {
  final String error;
  GetTopRatedMoviesUseCaseErrorState(this.error);
}

class GetTopRatedMoviesUseCaseSuccessesState extends MoviesStates {}
