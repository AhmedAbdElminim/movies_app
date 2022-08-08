import 'package:flutter/material.dart';
import 'package:movies_app/core/routes_manager/routes.dart';
import 'package:movies_app/core/shared_screen/splash_screen.dart';

import 'core/services/services_locator.dart';

void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey[900],
        ),
        cardColor: Colors.blueGrey[700],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.blueGrey[800],
            unselectedItemColor: Colors.white),
        scaffoldBackgroundColor: Colors.blueGrey[900],
      ),
      routes: routes,
      initialRoute: SplashScreen.splashScreenId,
    );
  }
}
