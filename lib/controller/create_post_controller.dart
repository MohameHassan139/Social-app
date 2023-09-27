import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/helper/cashe_helper.dart';
import 'package:social_app/model/post_model.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePostController extends GetxController {
  late PostModel model;
  String? uesrId;
  String? postUrl;
  late CollectionReference postCollection;
  TextEditingController postController = TextEditingController();
  final ImagePicker picker = ImagePicker();
  File? postImage;
  final storage = FirebaseStorage.instance;
  int rand = Random().nextInt(9999999);

  void removePostImage() {
    postImage = null;
    update();
  }

  Future<void> getpostImage() async {
    final pickerFile = picker.pickImage(source: ImageSource.gallery);
    if (pickerFile != null) {
      pickerFile.then((value) {
        postImage = File(value!.path);
        update();
      });
    } else {
      print('No Image Selected');
    }
  }

  Future<void> uploadPostImage() async {
    if (postImage != null) {
      try {
        await storage
            .ref()
            .child('posts')
            .child(uesrId!)
            .child('$rand${Uri.file(postImage!.path).pathSegments.last}')
            .putFile(postImage!)
            .then((Value) async {
          postUrl = await Value.ref.getDownloadURL();
        });
      } on firebase_core.FirebaseException catch (e) {
        print(e.toString());
      }
    }
  }

  Future<void> addPostData({required Map<String, dynamic> map}) async {
    postCollection.add(map);
  }

  bool uploading = false;
  Future<void> addPost({
    required String? name,
    String? image,
    required String? text,
    required String? uesrId,
    required String? dateTime,
  }) async {
    uploading = true;
    update();
    if (postImage != null) {
      uploadPostImage().then((value) {
        addPostData(map: {
          'name': name,
          'text': text,
          'uesrId': uesrId,
          'dateTime': dateTime,
          'image': image,
          'postImage': postUrl
        }).then((value) {
          uploading = false;
          update();
        });
      });
    } else {
      addPostData(map: {
        'name': name,
        'text': text,
        'uesrId': uesrId,
        'dateTime': dateTime,
        'image': image,
        'postImage': null,
      }).then((value) {
        uploading = false;
        update();
      });
    }
  }

  @override
  void onInit() {
    uesrId = CacheHelper.prefs?.getString('userId');
    postCollection = FirebaseFirestore.instance.collection('posts');

    super.onInit();
  }
}
