abstract class TopRatedState{}
class TopRatedInitialState extends TopRatedState{}
class TopRatedLoadingState extends TopRatedState{}
class TopRatedSuccessState extends TopRatedState{}
class TopRatedErrorState extends TopRatedState{
  final String error;
  TopRatedErrorState(this.error);
}



