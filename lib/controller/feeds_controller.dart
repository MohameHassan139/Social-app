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
  List<PostModel> postsList = [];

  late CollectionReference postCollection;
  String? userId = CacheHelper.prefs?.getString('userId');
  UserDataModel userDataModel = UserDataModel();

  Future<void> addLike({required String postId}) async {
    postCollection.doc(postId).collection('Likes').doc(userId).set({
      'like': true,
    });
  }

  bool isliked = false;
  late int numLikes;
  Future<void> getNumLikes({required String postId}) async {
    postCollection.doc(postId).collection('Likes').get().then((value) {
      value.docs.map((doc) {
        if (doc.id == userId) {
          isliked = true;
        }
      });

      numLikes = value.docs.length;
      
    });
  }

  Future<void> removeLike({required String postId}) async {
    postCollection.doc(postId).collection('Likes').doc(userId).delete();
  }

  @override
  void onInit() {
    postCollection = FirebaseFirestore.instance.collection('posts');

    super.onInit();
  }
}
