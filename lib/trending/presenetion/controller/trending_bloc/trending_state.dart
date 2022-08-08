abstract class TrendingState {}

class TrendingInitialState extends TrendingState {}

class TrendingLoadingState extends TrendingState {}

class TrendingSuccessState extends TrendingState {}

class TrendingErrorState extends TrendingState {
  final String error;
  TrendingErrorState(this.error);
}
class CurrentTrendingIndexState extends TrendingState {}

