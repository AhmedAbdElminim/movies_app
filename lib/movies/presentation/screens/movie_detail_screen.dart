import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/core/network/api_constant.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/presentation/controller/movie_detail_recommendation_movie/movie_detail_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/services/services_locator.dart';
import '../../../core/shared_screen/youtube_player.dart';
import '../../domain/entities/genre.dart';
import '../../domain/entities/movie_detail.dart';
import '../controller/movie_detail_recommendation_movie/movie_detail_state.dart';

class MovieDetailScreen extends StatelessWidget {
  // final int id;

  const MovieDetailScreen({Key? key}) : super(key: key);
  static String detailScreenId = 'DetailScreen';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailScreenArgument;
    return BlocProvider(
        create: (context) => MovieDetailCubit(sl(), sl(), sl())
          ..getMovieDetail(movieId: args.id)
          ..getRecommendationMovies(movieId: args.id)
          ..getMovieVideo(movieId: args.id),
        child: BlocConsumer<MovieDetailCubit, MovieDetailState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = MovieDetailCubit.get(context);
            return Scaffold(
              body: ConditionalBuilder(
                condition: cubit.recommendationList.isNotEmpty &&
                    cubit.movieDetail != null &&
                    cubit.video != null,
                builder: (context) => MovieDetailContent(
                  movie: cubit.movieDetail!,
                  recommendations: cubit.recommendationList,
                  recommendationListLength: cubit.recommendationList.length,
                  videoKey: cubit.video!.videoKey,
                ),
                fallback: (context) => Center(
                  child: LoadingAnimationWidget.flickr(
                      leftDotColor: Colors.purple,
                      rightDotColor: Colors.pink,
                      size: 30.0),
                ),
              ),
            );
          },
        ));
  }
}

class MovieDetailContent extends StatelessWidget {
  final MovieDetail movie;
  final List<Recommendation> recommendations;
  final int recommendationListLength;
  final String videoKey;

  const MovieDetailContent({
    Key? key,
    required this.movie,
    required this.recommendations,
    required this.recommendationListLength,
    required this.videoKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('movieDetailScrollView'),
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: FadeIn(
              duration: const Duration(milliseconds: 500),
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.5, 1.0, 1.0],
                  ).createShader(
                    Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                  );
                },
                blendMode: BlendMode.dstIn,
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  imageUrl: ApiConstant.imageUrl(movie.backdropPath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PlayMovieScreen(videoKey: videoKey)));
                    },
                    color: Colors.red,
                    child: const Text('Play Movie Demo'),
                  )),
                  Text(movie.title,
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      )),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 2.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          movie.releaseDate.split('-')[0],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20.0,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            (movie.voteAverage / 2).toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '(${movie.voteAverage})',
                            style: const TextStyle(
                              fontSize: 1.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        _showDuration(movie.runTime),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    movie.overview,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Genres: ${_showGenres(movie.genre)}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
          sliver: SliverToBoxAdapter(
            child: FadeInUp(
              from: 20,
              duration: const Duration(milliseconds: 500),
              child: Text(
                'More like this'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ),
        // Tab(text: 'More like this'.toUpperCase()),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
          sliver: _showRecommendations(
              recommendationListLength: recommendationListLength),
        ),
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  Widget _showRecommendations({required int recommendationListLength}) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final recommendation = recommendations[index];
          return FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              child: CachedNetworkImage(
                imageUrl: ApiConstant.imageUrl(recommendation.backdropPath!),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: 170.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                height: 180.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
        childCount: recommendationListLength,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7,
        crossAxisCount: 3,
      ),
    );
  }
}

class DetailScreenArgument {
  final int id;
  DetailScreenArgument(this.id);
}
