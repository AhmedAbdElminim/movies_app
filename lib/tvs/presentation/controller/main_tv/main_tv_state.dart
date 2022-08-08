abstract class TvStates {}

class TvsInitialState extends TvStates {}

class GetNowPlayingTvsUseCaseLoadingState extends TvStates {}

class GetNowPlayingTvsUseCaseErrorState extends TvStates {
  final String error;
  GetNowPlayingTvsUseCaseErrorState(this.error);
}

class GetNowPlayingTvsUseCaseSuccessesState extends TvStates {}

class GetPopularTvsUseCaseLoadingState extends TvStates {}

class GetPopularTvsUseCaseErrorState extends TvStates {
  final String error;
  GetPopularTvsUseCaseErrorState(this.error);
}

class GetPopularTvsUseCaseSuccessesState extends TvStates {}

class GetTopRatedTvsUseCaseLoadingState extends TvStates {}

class GetTopRatedTvsUseCaseErrorState extends TvStates {
  final String error;
  GetTopRatedTvsUseCaseErrorState(this.error);
}

class GetTopRatedTvsUseCaseSuccessesState extends TvStates {}
