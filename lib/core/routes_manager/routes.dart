import 'package:flutter/Material.dart';
import 'package:movies_app/core/layout/layout.dart';
import 'package:movies_app/core/shared_screen/splash_screen.dart';
import 'package:movies_app/movies/presentation/screens/movie_detail_screen.dart';

import '../../movies/presentation/screens/popular_screen.dart';
import '../../movies/presentation/screens/top_rated_screen.dart';
import '../../trending/presenetion/screen/trending_screen.dart';
import '../../tvs/presentation/screens/detail_tv_screen.dart';
import '../../tvs/presentation/screens/popular_tv_screen.dart';
import '../../tvs/presentation/screens/toprated_tv_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LayOut.screenId: (context) => const LayOut(),
  MovieDetailScreen.detailScreenId: (context) => const MovieDetailScreen(),
  TopRatedScreen.topRatedScreenId: (context) => const TopRatedScreen(),
  PopularMoviesScreen.popularScreenId: (context) => const PopularMoviesScreen(),
  TopRatedTvScreen.topRatedTvScreenId: (context) => const TopRatedTvScreen(),
  PopularTvScreen.popularTvScreenId: (context) => const PopularTvScreen(),
  TvDetailScreen.tvDetailScreenId: (context) => const TvDetailScreen(),
  TrendingScreen.trendingScreenId: (context) =>  TrendingScreen(),
  SplashScreen.splashScreenId:(context)=>const SplashScreen()

};
