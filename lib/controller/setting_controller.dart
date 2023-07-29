import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../helper/cashe_helper.dart';
import '../model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SettingController extends GetxController {
  late UserDataModel model;
  String? uesrId;
  CollectionReference? users;
  DocumentReference? doc;
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  XFile? backgroundImage;
  File? profileImage;
  final storage = FirebaseStorage.instance;
  int rand = Random().nextInt(9999999);

// Pick an image.
  Future<void> getbackgroundImage() async {
    final pickerFile = picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      pickerFile.then((value) {
        backgroundImage = value;
        update();
      });
    } else {
      print('No Image Selected');
    }
  }

  Future<void> getprofileImage() async {
    final pickerFile = picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      pickerFile.then((value) {
        profileImage = File( value!.path);
        update();
      });
    } else {
      print('No Image Selected');
    }
  }

  Future<void> uploadProfileImage() async {
    if (profileImage != null) {
      print('@@@@@@@@@@@@@@@@@@@@@@@@#####');
      print(rand);

      storage
          .ref()
          .child('users')
          .child(uesrId!)
          .child('$rand${Uri.file(profileImage!.path).pathSegments.last}')
          .putFile(profileImage!)
          .then((value) {
        print('Upload image success');
      }).catchError((error) {
        print('@@@@@@@@@@@@@@@@@@@@@@@@');
        print(error.toString());
        print('@@@@@@@@@@@@@@@@@@@@@@@@');
      });
    }
  }

  @override
  void onInit() {
    uesrId = CacheHelper.prefs?.getString('userId');
    users = FirebaseFirestore.instance.collection('users');
    doc = users?.doc(uesrId);
    // doc?.get().then((value) {
    //   model = UserDataModel.fromJson(value.data() as Map<String, dynamic>);
    // });

    super.onInit();
  }
}
