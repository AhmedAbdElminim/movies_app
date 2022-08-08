import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/popular_movie/popular_state.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../domain/entities/movies.dart';

class PopularCubit extends Cubit<PopularStates> {
  PopularCubit(this.getPopularMoviesUseCase) : super(PopularInitialState());
  static PopularCubit get(context) => BlocProvider.of(context);
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  List<Movie> popularMoviesList = [];

  Future<void> getPopularMovies() async {
    emit(PopularLoadingState());
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold((l) => emit(PopularErrorState(l.errorMessage)), (r) {
      popularMoviesList = r;
    });
    emit(PopularSuccessState());
  }
}
