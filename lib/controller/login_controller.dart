import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/constants/const.dart';
import 'package:social_app/helper/cashe_helper.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/app_routes.dart';
import '../model/user_model.dart';
import '../view/widgets/toast.dart';

class LoginController extends GetxController {
  RxBool state = true.obs;
  bool isverfied = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;
  IconData icon = Icons.remove_red_eye;
  String? uesrId;

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
        CacheHelper.prefs?.setString('userId', uesrId!);
        getUserData().then((value) {
          Get.offNamed(AppRoutes.home);
        });

        // toast(msg: 'login sccess', color: Colors.green);
      }
      update();
    }).catchError((error) {
      state = true.obs;
      // toast(msg: error.toString(), color: Colors.red);
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

  Future<void> getUserData() async {
    CollectionReference user = FirebaseFirestore.instance.collection('users');
    await user.doc(uesrId).get().then((value) {
      UserDataModel userModel =
          UserDataModel.fromJson(value.data() as Map<String, dynamic>);
      print('get user data');
      CacheHelper.addUserDataToPrefs(userModel: userModel).then((value) {});

      update();
    });
  }
}
