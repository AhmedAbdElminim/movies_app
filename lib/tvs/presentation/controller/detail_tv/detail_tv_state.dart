abstract class DetailTvStates {}

class DetailTvInitialState extends DetailTvStates {}

class DetailTvLoadingState extends DetailTvStates {}

class DetailTvSuccessState extends DetailTvStates {}

class DetailTvErrorState extends DetailTvStates {
  final String error;

  DetailTvErrorState(this.error);
}

class RecommendationTvLoadingState extends DetailTvStates {}

class RecommendationTvSuccessState extends DetailTvStates {}

class RecommendationTvErrorState extends DetailTvStates {
  final String error;

  RecommendationTvErrorState(this.error);
}
class VideoTvSuccessState extends DetailTvStates {}
class VideoTvLoadingState extends DetailTvStates {}
