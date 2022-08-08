abstract class PopularTvStates{}
class PopularTvInitialState extends PopularTvStates{}
class PopularTvLoadingState extends PopularTvStates{}
class PopularTvSuccessState extends PopularTvStates{}
class PopularTvErrorState extends PopularTvStates{
  final String error;
  PopularTvErrorState(this.error);

}