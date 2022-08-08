import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/core/network/api_constant.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/services/services_locator.dart';
import '../../domain/entities/trending.dart';
import '../controller/trending_bloc/trending_cubit.dart';
import '../controller/trending_bloc/trending_state.dart';

class TrendingScreen extends StatelessWidget {
  TrendingScreen({Key? key}) : super(key: key);
  static String trendingScreenId = 'TrendingScreen';
  //ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TrendingCubit(sl())..getTrending(),
        child: BlocConsumer<TrendingCubit, TrendingState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = TrendingCubit.get(context);
            ScrollController scrollController = ScrollController();
            return Scaffold(
              body: ConditionalBuilder(
                condition: cubit.trendingList.isNotEmpty,
                builder: (context) => MovieDetailContent(
                  currentIndex: cubit.currentIndex,
                  trending: cubit.trendingList,
                  trendingListLength: cubit.trendingList.length,
                  scrollController: scrollController,
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
  final int currentIndex;
  final List<Trending> trending;
  final int trendingListLength;
  final ScrollController scrollController;

  const MovieDetailContent(
      {Key? key,
      required this.currentIndex,
      required this.trending,
      required this.trendingListLength,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      key: const Key('TrendingScrollView'),
      controller: scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
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
                  imageUrl:
                      ApiConstant.imageUrl(trending[currentIndex].backdropPath),
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
                  Text(trending[currentIndex].title,
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
                          trending[currentIndex].releaseDate.split('-')[0],
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
                            (trending[currentIndex].voteAverage / 2)
                                .toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            '(${trending[currentIndex].voteAverage})',
                            style: const TextStyle(
                              fontSize: 1.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16.0),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    trending[currentIndex].overview,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Media Type: ${trending[currentIndex].mediaType}',
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
                'Trending Today'.toUpperCase(),
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
          sliver: _showRecommendations(trendingListLength: trendingListLength),
        ),
      ],
    );
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

  Widget _showRecommendations({required int trendingListLength}) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final trend = trending[index];

          return FadeInUp(
            from: 20,
            duration: const Duration(milliseconds: 500),
            child: InkWell(
              onTap: () {
                TrendingCubit.get(context).changeCurrentIndex(index);
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: CachedNetworkImage(
                  imageUrl: ApiConstant.imageUrl(trend.backdropPath),
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
            ),
          );
        },
        childCount: trendingListLength,
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
