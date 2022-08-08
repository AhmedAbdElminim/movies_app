import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/popular_movie/popular_cubit.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_cubit/top_rated_cubit.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_popular_play_now_cubit/movies_cubit.dart';

import '../../movies/domain/repository/base_movies_repository.dart';
import '../../movies/domain/usecases/get_video_usecase.dart';
import '../../movies/presentation/controller/movie_detail_recommendation_movie/movie_detail_cubit.dart';
import '../../trending/data/datasource/trending_remote_data_source.dart';
import '../../trending/data/repository/trending_repository.dart';
import '../../trending/domain/repository/base_trending_repository.dart';
import '../../trending/domain/usecase/get_trending_usecase.dart';
import '../../trending/presenetion/controller/trending_bloc/trending_cubit.dart';
import '../../tvs/data/datasource/tv_remote_data_source.dart';
import '../../tvs/data/repository/tv_repository.dart';
import '../../tvs/domain/repository/base_tv_repository.dart';
import '../../tvs/domain/usecases/get_popular_tv_usecase.dart';
import '../../tvs/domain/usecases/get_toprated_tv_usecase.dart';
import '../../tvs/domain/usecases/get_tv_air_now_usecase.dart';
import '../../tvs/domain/usecases/get_tv_detail_usecase.dart';
import '../../tvs/domain/usecases/get_tv_recommendation_usecase.dart';
import '../../tvs/domain/usecases/get_tv_video_usecase.dart';
import '../../tvs/presentation/controller/detail_tv/detail_tv_cubit.dart';
import '../../tvs/presentation/controller/main_tv/main_tv_cubit.dart';
import '../../tvs/presentation/controller/popular_tv/popular_tv_cubit.dart';
import '../../tvs/presentation/controller/toprated_tv/toprated_tv_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///CUBIT
    sl.registerFactory(() => MoviesCubit(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailCubit(sl(), sl(),sl()));
    sl.registerFactory(() => TopRatedCubit(sl()));
    sl.registerFactory(() => PopularCubit(sl()));
    sl.registerFactory(() => TvCubit(sl(), sl(), sl()));
    sl.registerFactory(() => TopRatedTvCubit(sl()));
    sl.registerFactory(() => PopularTvCubit(sl()));
    sl.registerFactory(() => TvDetailCubit(sl(), sl(),sl()));
    sl.registerFactory(() => TrendingCubit(sl()));

    ///USE CASE
    //MOVIE USE CASES
    sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetVideoUseCase(sl()));


    //TV USE CASES
    sl.registerLazySingleton(() => GetNowPlayTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetTvRecommendationUseCase(sl()));
    sl.registerLazySingleton(() => GetTvVideoUseCase(sl()));

    //TRENDING USE CASE
    sl.registerLazySingleton(() => GetTrendingUseCase(sl()));

    ///REPOSITORY

    //MOVIE REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepository(sl()));

    //TV REPOSITORY
    sl.registerLazySingleton<BaseTvRepository>(() => TvRepository(sl()));

    //TRENDING REPOSITORY
    sl.registerLazySingleton<BaseTrendingRepository>(
        () => TrendingRepository(sl()));

    ///DATA SOURCE
    //MOVIE DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    //TV DATA SOURCE
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    //TRENDING DATA SOURCE
    sl.registerLazySingleton<BaseTrendingRemoteDataSource>(
        () => TrendingRemoteDataSource());
  }
}
