import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/constants/app_routes.dart';
import '../helper/cashe_helper.dart';
import '../model/user_model.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class profileController extends GetxController {
  late UserDataModel model;
  String? uesrId;
  String? profileUrl;
  String? coverUrl;
  late CollectionReference users;
  late DocumentReference doc;
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? backgroundImage;
  File? profileImage;
  final storage = FirebaseStorage.instance;
  int rand = Random().nextInt(9999999);

// Pick an image.
  Future<void> getbackgroundImage() async {
    final pickerFile = picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      pickerFile.then((value) {
        backgroundImage = File(value!.path);
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
        profileImage = File(value!.path);
        update();
      });
    } else {
      print('No Image Selected');
    }
  }

  Future<void> uploadProfileImage() async {
    if (profileImage != null) {
      try {
        await storage
            .ref()
            .child('users')
            .child(uesrId!)
            .child('$rand${Uri.file(profileImage!.path).pathSegments.last}')
            .putFile(profileImage!)
            .then((Value) async {
          profileUrl = await Value.ref.getDownloadURL();
        });
      } on firebase_core.FirebaseException catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> uploadcoverImage() async {
    if (profileImage != null) {
      try {
        await storage
            .ref()
            .child('users')
            .child(uesrId!)
            .child('$rand${Uri.file(backgroundImage!.path).pathSegments.last}')
            .putFile(backgroundImage!)
            .then((Value) async {
          coverUrl = await Value.ref.getDownloadURL();
        });
      } on firebase_core.FirebaseException catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> updateUserData({required Map<String, String?> map}) async {
    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot documentSnapshot = await transaction.get(doc);
      if (documentSnapshot.exists) {
        transaction.update(doc, map);
      }
    }).then((value) {
      update();
    });
  }

  bool uploading = false;
  Future<void> uploadUserinfo({
    required String name,
    String? image,
    String? cover,
    required String bio,
    required String phone,
  }) async {
    uploading = true;
    update();
    WidgetsFlutterBinding.ensureInitialized();

    if (backgroundImage != null || profileImage != null) {
      uploadProfileImage().then((value) {
        uploadcoverImage().then((value) {
          updateUserData(map: {
            'name': name,
            'bio': bio,
            'phone': phone,
            'image': profileUrl,
            'caver': coverUrl
          }).then((value) {
            uploading = false;
            update();
          });
        });
      });
    } else if (profileImage != null && backgroundImage == null) {
      uploadProfileImage().then((value) {
        updateUserData(map: {
          'name': name,
          'bio': bio,
          'phone': phone,
          'image': profileUrl,
        }).then((value) {
          uploading = false;
          update();
        });
      });
    } else if (backgroundImage != null && profileImage == null) {
      uploadcoverImage().then((value) {
        updateUserData(map: {
          'name': name,
          'bio': bio,
          'phone': phone,
          'caver': coverUrl
        }).then((value) {
          uploading = false;
          update();
        });
      });
    } else {
      updateUserData(map: {
        'name': name,
        'bio': bio,
        'phone': phone,
      }).then((value) {
        uploading = false;
        update();
      });
    }
  }

  @override
  void onInit() {
    uesrId = CacheHelper.prefs?.getString('userId');
    users = FirebaseFirestore.instance.collection('users');
    doc = users.doc(uesrId);
   

    super.onInit();
  }
}
