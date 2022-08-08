import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/network/api_constant.dart';
import '../controller/main_tv/main_tv_cubit.dart';
import '../controller/main_tv/main_tv_state.dart';
import '../screens/detail_tv_screen.dart';

class NowPlayingTvComponent extends StatelessWidget {
  const NowPlayingTvComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TvCubit, TvStates>(
      // buildWhen: (previous,current)=>previous.,
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TvCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.nowPlayTvsList.isNotEmpty,
          builder: (context) => FadeIn(
            duration: const Duration(milliseconds: 500),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {},
              ),
              items: cubit.nowPlayTvsList.map(
                (item) {
                  return GestureDetector(
                    key: const Key('openMovieMinimalDetail'),
                    onTap: () {
                      //TODO: NAVIGATE TO THE TV DETAILS
                      Navigator.pushNamed(
                          context, TvDetailScreen.tvDetailScreenId,
                          arguments: TvDetailScreenArgument(
                              id: item.id, overview: item.overview));
                    },
                    child: Stack(
                      children: [
                        ShaderMask(
                          shaderCallback: (rect) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                // fromLTRB
                                Colors.transparent,
                                Colors.black,
                                Colors.black,
                                Colors.transparent,
                              ],
                              stops: [0, 0.3, 0.5, 1],
                            ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height),
                            );
                          },
                          blendMode: BlendMode.dstIn,
                          child: CachedNetworkImage(
                            height: 560.0,
                            imageUrl: ApiConstant.imageUrl(item.backdropPath!),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.redAccent,
                                      size: 16.0,
                                    ),
                                    const SizedBox(width: 4.0),
                                    Text(
                                      'ON THE AIR'.toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text(
                                  item.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          fallback: (context) => Center(
            child: SizedBox(
                height: 400,
                width: double.infinity,
                child: Center(
                    child: LoadingAnimationWidget.halfTriangleDot(
                        color: Colors.red, size: 50))),
          ),
        );
      },
    );
  }
}
