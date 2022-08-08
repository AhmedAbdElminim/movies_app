abstract class PopularStates{}
class PopularInitialState extends PopularStates{}
class PopularLoadingState extends PopularStates{}
class PopularSuccessState extends PopularStates{}
class PopularErrorState extends PopularStates{
  final String error;
  PopularErrorState(this.error);
}