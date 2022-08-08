import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_cubit/top_rated_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constant.dart';
import '../../../core/services/services_locator.dart';
import '../controller/top_rated_cubit/top_rated_state.dart';
import 'movie_detail_screen.dart';

class TopRatedScreen extends StatelessWidget {

   const TopRatedScreen({Key? key}) : super(key: key);
   static String topRatedScreenId='TopRatedScreenId';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>TopRatedCubit(sl())..getTopRatedMovies(),
      child: BlocConsumer<TopRatedCubit,TopRatedState>(
        listener: (context,state){},
        builder: (context,state){
          var cubit=TopRatedCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading:  IconButton(onPressed: (){Navigator.pop(context);},icon:const Icon(Icons.arrow_back_ios),),
              centerTitle: true,
              title: const Text('Top Rated Movies'),
            ),
            body:ConditionalBuilder(condition: cubit.topRatedMoviesList.isNotEmpty,
                builder: (context)=> Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.separated(
                    itemBuilder: (context, index) => SizedBox(
                      width: double.infinity,
                      height: 170,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, MovieDetailScreen.detailScreenId,arguments: DetailScreenArgument(cubit.topRatedMoviesList[index].id));
                        },
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(8.0)),
                                    child: CachedNetworkImage(
                                      width: 120.0,
                                      height: double.infinity,
                                      fit: BoxFit.cover,
                                      imageUrl: ApiConstant.imageUrl(cubit.topRatedMoviesList[index].backdropPath),
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        cubit.topRatedMoviesList[index].title,
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
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 2.0,
                                              horizontal: 8.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child:  Text(
                                              cubit.topRatedMoviesList[index].releaseDate.split('-')[0],
                                              style:const TextStyle(
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
                                                  fontWeight: FontWeight.w500,
                                                  letterSpacing: 1.2,
                                                ),
                                              ),
                                              const SizedBox(width: 4.0),
                                              Text(
                                                '(${cubit.topRatedMoviesList[index].voteAverage})',
                                                style:const TextStyle(
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
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(cubit.topRatedMoviesList[index].overview,
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
                    itemCount: cubit.topRatedMoviesList.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 7,
                    ),
                  ),
                ),
                fallback: (context)=>Center(child:  LoadingAnimationWidget.flickr(leftDotColor: Colors.purple, rightDotColor: Colors.pink, size: 30.0),)),
          );
        },
      ),

    );
  }
}
