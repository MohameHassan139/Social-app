import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_app/constants/app_routes.dart';
import 'package:social_app/view/screens/chats.dart';
import 'package:social_app/view/screens/feeds.dart';

import '../view/screens/home_screen.dart';
import '../view/screens/post_screen.dart';
import '../view/screens/setting.dart';
import '../view/screens/user.dart';

class BottonNavController extends GetxController {
  int currentIndex = 0;
  List<String> title = [
    'Home',
    'Chat',
    '',
    'User',
    'Setting',
  ];
  List<Widget> screens = [
    const FeedsScreen(),
    const ChatScreen(),
    const PostScreen(),
    const UserScreen(),
    const SettingScreen(),
  ];
  void chanageBottomNavBar(int index) {
    if (index == 2) {
      Get.toNamed(AppRoutes.post);
      
    } else
      currentIndex = index;
    update();
  }
}
