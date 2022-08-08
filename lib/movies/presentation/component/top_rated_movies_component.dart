import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_popular_play_now_cubit/movies_cubit.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_popular_play_now_cubit/movies_states.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constant.dart';
import '../../../core/utils/dummy.dart';

class TopRatedMoviesComponent extends StatelessWidget {
  const TopRatedMoviesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesStates>(
      buildWhen: (previous, current) => previous != current,
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = MoviesCubit.get(context);
        return ConditionalBuilder(
            condition: cubit.topRatedMoviesList.isNotEmpty,
            builder: (context) => FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 170.0,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: cubit.topRatedMoviesList.length,
                      itemBuilder: (context, index) {
                        final movie = cubit.topRatedMoviesList[index];
                        return Container(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: InkWell(
                            onTap: () {
                              /// TODO : NAVIGATE TO  MOVIE DETAILS
                            },
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              child: CachedNetworkImage(
                                width: 120.0,
                                fit: BoxFit.cover,
                                imageUrl:
                                    ApiConstant.imageUrl(movie.backdropPath),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
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
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
            fallback: (context) => SizedBox(
                  height: 170,
                  child: Center(
                    child: LoadingAnimationWidget.halfTriangleDot(
                        color: Colors.red, size: 50),
                  ),
                ));
      },
    );
  }
}
