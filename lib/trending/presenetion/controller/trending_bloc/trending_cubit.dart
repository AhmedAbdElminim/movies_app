import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/trending/domain/usecase/get_trending_usecase.dart';
import 'package:movies_app/trending/presenetion/controller/trending_bloc/trending_state.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../domain/entities/trending.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit(this.getTrendingUseCase) : super(TrendingInitialState());
  static TrendingCubit get(context) => BlocProvider.of(context);
  final GetTrendingUseCase getTrendingUseCase;
  List<Trending> trendingList = [];
  Future<void> getTrending() async {
    emit(TrendingLoadingState());
    final result = await getTrendingUseCase(const NoParameter());
    result.fold((l) => emit(TrendingErrorState(l.errorMessage)), (r) {
      trendingList = r;
    });
    emit(TrendingSuccessState());
  }

  int currentIndex = 0;
  void changeCurrentIndex(int num) {
    currentIndex = num;
    emit(CurrentTrendingIndexState());
  }
}
