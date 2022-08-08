import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constant.dart';
import '../../../core/services/services_locator.dart';
import '../controller/popular_tv/popular_tv_cubit.dart';
import '../controller/popular_tv/popular_tv_state.dart';
import 'detail_tv_screen.dart';

class PopularTvScreen extends StatelessWidget {
  const PopularTvScreen({Key? key}) : super(key: key);
  static String popularTvScreenId = 'popularTvScreenId';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularTvCubit(sl())..getPopularTvs(),
      child: BlocConsumer<PopularTvCubit, PopularTvStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = PopularTvCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading:  IconButton(onPressed: (){Navigator.pop(context);},icon:const Icon(Icons.arrow_back_ios),),
              centerTitle: true,
              title: const Text('Popular Tv'),
            ),
            body: ConditionalBuilder(
                condition: cubit.popularTvList.isNotEmpty,
                builder: (context) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.separated(
                        itemBuilder: (context, index) => SizedBox(
                          width: double.infinity,
                          height: 170,
                          child: InkWell(
                            onTap: () {
                              //TODO:MOVE TO DETAIL SCREEN
                              Navigator.pushNamed(
                                  context, TvDetailScreen.tvDetailScreenId,
                                  arguments: TvDetailScreenArgument(
                                      id:cubit.popularTvList[index].id,overview: cubit.popularTvList[index].overview));
                              //Navigator.pushNamed(context, MovieDetailScreen.detailScreenId,arguments: DetailScreenArgument(cubit.popularMoviesList[index].id));
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8.0)),
                                        child: CachedNetworkImage(
                                          width: 120.0,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                          imageUrl: ApiConstant.imageUrl(cubit
                                              .popularTvList[index]
                                              .backdropPath!),
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey[850]!,
                                            highlightColor: Colors.grey[800]!,
                                            child: Container(
                                              height: 170.0,
                                              width: 120.0,
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            cubit.popularTvList[index].name,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              //letterSpacing: 1.2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  vertical: 2.0,
                                                  horizontal: 8.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Text(
                                                  '2022',
                                                  //cubit.popularTvList[index].releaseDate.split('-')[0],
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
                                                    (7 / 2).toStringAsFixed(1),
                                                    style: const TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 4.0),
                                                  Text(
                                                    '(${cubit.popularTvList[index].voteAverage})',
                                                    style: const TextStyle(
                                                      fontSize: 1.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1.2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 16.0),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            cubit.popularTvList[index].overview,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        itemCount: cubit.popularTvList.length,
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 7,
                        ),
                      ),
                    ),
                fallback: (context) => Center(
                      child: LoadingAnimationWidget.flickr(
                          leftDotColor: Colors.purple,
                          rightDotColor: Colors.pink,
                          size: 30.0),
                    )),
          );
        },
      ),
    );
  }
}
