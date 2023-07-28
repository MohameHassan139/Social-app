import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_app/constants/app_routes.dart';
import 'package:social_app/constants/const.dart';
import 'package:social_app/view/screens/chats.dart';
import 'package:social_app/view/screens/feeds.dart';
import '../model/user_model.dart';

import '../view/screens/home_screen.dart';
import '../view/screens/post_screen.dart';
import '../view/screens/setting.dart';
import '../view/screens/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BottonNavController extends GetxController {
  int currentIndex = 3;


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
     UserScreen(),
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
