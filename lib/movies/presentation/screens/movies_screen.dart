
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/movies/presentation/controller/top_rated_popular_play_now_cubit/movies_cubit.dart';
import 'package:movies_app/movies/presentation/screens/popular_screen.dart';
import 'package:movies_app/movies/presentation/screens/top_rated_screen.dart';

import '../../../core/services/services_locator.dart';
import '../component/now_playing_movies_component.dart';
import '../component/popular_movies_component.dart';
import '../component/top_rated_movies_component.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>MoviesCubit(sl(),sl(),sl())..getNowPlayMovies()..getPopularMovies()..getTopRatedMovies(),
    child: Scaffold(

      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingMoviesComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {

                       Navigator.pushNamed(context, PopularMoviesScreen.popularScreenId);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PopularMoviesComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, TopRatedScreen.topRatedScreenId);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(
                            'See More',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TopRatedMoviesComponent(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    ),
    );
  }
}
