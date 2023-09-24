import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/constants/const.dart';
import '../constants/app_routes.dart';
import '../helper/cashe_helper.dart';
import '../model/user_model.dart';
import '../view/widgets/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends GetxController {
  late TextEditingController nameTextController;
  late TextEditingController emailTextController;
  late TextEditingController phoneTextController;
  late TextEditingController passwordTextController;
  late TextEditingController rePasswordTextController;
  DateTime? selectedDate;
  late CollectionReference users;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? uesrId = CacheHelper.prefs?.getString('userId');

  RxBool state = true.obs;
  bool isPassword = true;
  IconData icon = Icons.remove_red_eye;
  late CreateUserModel model;

  @override
  signUp() async {
    if (passwordTextController.text != rePasswordTextController.text) {
      // toast(msg: 'the password not the same');

      return;
    }

    if (formKey.currentState!.validate()) {
      state = false.obs;

      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text)
          .then((value) async {
        String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
        model = CreateUserModel(
          email: emailTextController.text,
          name: nameTextController.text,
          
          image:
              'https://th.bing.com/th/id/R.b9941d2d7120044bd1d8e91c5556c131?rik=sDJfLfGGErT9Fg&pid=ImgRaw&r=0',
        );
        createUser(map: model);
        state = true.obs;
        FirebaseAuth.instance.currentUser?.sendEmailVerification();
        // toast(
        //     msg: ' please go to your mail to active your account',
        //     color: Colors.green);
      });
    }
  }

  createUser({CreateUserModel? map}) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(uesrId)
        .set(map!.toJson());
  }

  goToLogin() {
    Get.offNamed(AppRoutes.login);
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

  @override
  void onInit() {
    nameTextController = TextEditingController();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    rePasswordTextController = TextEditingController();
    phoneTextController = TextEditingController();
    users = FirebaseFirestore.instance.collection('users');
    super.onInit();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }
}
