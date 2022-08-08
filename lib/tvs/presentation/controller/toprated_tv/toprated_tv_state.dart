abstract class TopRatedTvStates{}
class TopRatedTvInitialState extends TopRatedTvStates{}
class TopRatedTvLoadingState extends TopRatedTvStates{}
class TopRatedTvSuccessState extends TopRatedTvStates{}
class TopRatedTvErrorState extends TopRatedTvStates{
  final String error;
  TopRatedTvErrorState(this.error);

}