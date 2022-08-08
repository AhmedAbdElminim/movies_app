import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/Material.dart';
import 'package:lottie/lottie.dart';

import '../layout/layout.dart';
import 'package:page_transition/page_transition.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String splashScreenId='SplashScreenId';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:Lottie.network('https://assets9.lottiefiles.com/packages/lf20_itjl9rou.json'),
      nextScreen:const LayOut(),
      backgroundColor: Colors.blueGrey[900]!,
      duration: 5000,
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.leftToRight,
    );
  }
}
