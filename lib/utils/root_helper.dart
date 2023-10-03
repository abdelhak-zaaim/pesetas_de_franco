import 'dart:convert';
import 'package:get/get.dart';

import '../screens/main_screen.dart';
import '../screens/splashScreen.dart';


class RouteHelper {
  static const String splash = '/splash';
  static const String home = '/home';



  static getSplashRoute() => splash;
  static String getHomeRoute() => home;





  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
   GetPage(name: home, page: () =>  MainScreen()),

  ];

}