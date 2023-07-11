import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/constants/const.dart';

import '../constants/app_routes.dart';
import '../model/login_model.dart';
import '../view/screens/home_screen.dart';
import '../view/screens/home_screen.dart';
import '../view/widgets/toast.dart';

class LoginController extends GetxController {
  RxBool state = true.obs;
  bool isverfied = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  IconData icon = Icons.remove_red_eye;
  Future onSubmit({
    required String email,
    required String password,
  }) async {
    // WidgetsFlutterBinding.ensureInitialized();
    state = false.obs;
    // Firebase
    update();
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      state = true.obs;
      uesrId = FirebaseAuth.instance.currentUser?.uid;
      if (!FirebaseAuth.instance.currentUser!.emailVerified) {
        isverfied = true;
        update();
      } else {
        Get.offNamed(AppRoutes.home);
        toast(msg: 'login sccess', color: Colors.green);
      }
      update();
    }).catchError((error) {
      state = true.obs;
      toast(msg: error.toString(), color: Colors.red);
      update();
      print(error.toString());
    });

    update();
  }

  void showPassword() {
    if (isPassword) {
      isPassword = false;
      icon = Icons.visibility_off_outlined;
    } else {
      isPassword = true;
      icon = Icons.remove_red_eye;
    }
    update();
  }
}
