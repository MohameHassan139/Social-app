
import 'package:flutter/material.dart';
import '../view/screens/edit_profile_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/login_screen.dart';
import '../view/screens/post_screen.dart';
import '../view/screens/register_screen.dart';
import '../view/screens/profile.dart';



class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String confirmation = '/confirmation';
  static const String home = '/home';
  static const String post = '/post';
  static const String editeProfile = '/editeProfile';
  static const String Profile = '/Profile';
}

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.login: (context) => LoginScreen(),
  AppRoutes.register: (context) => RegisterScreen(),
  AppRoutes.home: (context) => HomeScreen(),
  AppRoutes.post: (context) => PostScreen(),
  AppRoutes.editeProfile: (context) => EditeProfile(),
  AppRoutes.Profile: (context) => ProfileScreen(),
};
