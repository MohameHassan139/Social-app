import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/helper/cashe_helper.dart';
import 'package:social_app/model/post_model.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/model/user_model.dart';

class FeedsController extends GetxController {
  late List<PostModel> postsList;
  late CollectionReference postCollection;
  
  UserDataModel userDataModel = UserDataModel();



  @override
  void onInit() {
    postCollection = FirebaseFirestore.instance.collection('posts');

    super.onInit();
  }
}
