import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_cubit/top_rated_state.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../domain/entities/movies.dart';

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit(this.getTopRatedMoviesUsCase) : super(TopRatedInitialState());
  static TopRatedCubit get(context) => BlocProvider.of(context);
  GetTopRatedMoviesUsCase getTopRatedMoviesUsCase;
  List<Movie> topRatedMoviesList = [];
  void getTopRatedMovies() async {
    emit(TopRatedLoadingState());
    final result = await getTopRatedMoviesUsCase(const NoParameter());
    result.fold((l) => emit(TopRatedErrorState(l.errorMessage)), (r) {
      topRatedMoviesList = r;
    });
    emit(TopRatedSuccessState());
  }
}
