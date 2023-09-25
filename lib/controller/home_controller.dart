import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:social_app/constants/app_routes.dart';
import 'package:social_app/view/screens/chats.dart';
import 'package:social_app/view/screens/feeds.dart';
import '../helper/cashe_helper.dart';
import '../model/user_model.dart';
import '../view/screens/post_screen.dart';
import '../view/screens/profile.dart';
import '../view/screens/setting.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';

class BottonNavController extends GetxController {
  int currentIndex = 0;
  //

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
    PostScreen(),
    ProfileScreen(),
    const SettingScreen(),
  ];
  void chanageBottomNavBar(int index) {
    if (index == 2) {
      Get.toNamed(AppRoutes.post);
    } else
      currentIndex = index;
    update();
  }

  @override
  void onInit() {
    UserDataModel userDataModel = UserDataModel();
    String? uesrId = CacheHelper.prefs?.getString('userId');
    var users = FirebaseFirestore.instance.collection('users');
    var doc = users.doc(uesrId);
    doc.get().then((value) {
      UserDataModel userModel =
          UserDataModel.fromJson(value.data() as Map<String, dynamic>);
      print('get user data');
      userDataModel.name = userModel.name;
      userDataModel.bio = userModel.bio;
      userDataModel.image = userModel.image;
      userDataModel.caver = userModel.caver;
      userDataModel.email = userModel.email;
      update();
    });

    super.onInit();
  }
}
