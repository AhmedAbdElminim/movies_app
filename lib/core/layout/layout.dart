import 'package:flutter/material.dart';
import 'package:movies_app/movies/presentation/screens/movies_screen.dart';

import '../shared_screen/youtube_player.dart';
import '../../trending/presenetion/screen/trending_screen.dart';
import '../../tvs/presentation/screens/main_tv_screen.dart';

class LayOut extends StatefulWidget {
  const LayOut({Key? key}) : super(key: key);
  static String screenId='LayOut';

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {


  List<Widget> screens = [const MainMoviesScreen(), const MainTvScreen(), TrendingScreen()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.movie),label:''),
          BottomNavigationBarItem(icon: Icon(Icons.tv),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up),label: ''),

        ],
      ),
    );
  }
}
