import '../utils/constants.dart';

class ApiConstant{

  ///MOVIE API END POINT
  static const String getNowPlayingMoviesPath='${AppConstants.baseUrl}movie/now_playing?api_key=${AppConstants.apiKey}';
  static const String getTopRatedMoviesPath='${AppConstants.baseUrl}movie/top_rated?api_key=${AppConstants.apiKey}';

  static const String getPopularMoviesPath='${AppConstants.baseUrl}movie/popular?api_key=${AppConstants.apiKey}';
  static  String getMovieDetailPath(int id)=>'${AppConstants.baseUrl}movie/$id?api_key=${AppConstants.apiKey}';
  static  String getMovieRecommendationPath(int id)=>'${AppConstants.baseUrl}movie/$id/recommendations?api_key=${AppConstants.apiKey}';
  static  String getMovieVideoPath(int id)=>'${AppConstants.baseUrl}movie/$id/videos?api_key=${AppConstants.apiKey}';

  ///IMAGE URL PATH
  static const String baseUrlImage='https://image.tmdb.org/t/p/w500';
  static  String imageUrl(String image)=>'$baseUrlImage$image';

///TV API END POINT
  static const String getNowPlayingTvPath='${AppConstants.baseUrl}tv/on_the_air?api_key=${AppConstants.apiKey}';
  static const String getTopRatedTvPath='${AppConstants.baseUrl}tv/top_rated?api_key=${AppConstants.apiKey}';
  static const String getPopularTvPath='${AppConstants.baseUrl}tv/popular?api_key=${AppConstants.apiKey}';
  static  String getTvDetailPath(int id)=>'${AppConstants.baseUrl}tv/$id?api_key=${AppConstants.apiKey}';
  static  String getTvRecommendationPath(int id)=>'${AppConstants.baseUrl}tv/$id/recommendations?api_key=${AppConstants.apiKey}';
  static  String getTvVideoPath(int id)=>'${AppConstants.baseUrl}tv/$id/videos?api_key=${AppConstants.apiKey}';

  ///TRENDING API
static const String getTrendingPath='${AppConstants.baseUrl}trending/all/day?api_key=${AppConstants.apiKey}';


}