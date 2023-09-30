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
  late allPosts postsList;

  late CollectionReference postCollection;
  String? userId = CacheHelper.prefs?.getString('userId');
  UserDataModel userDataModel = UserDataModel();

  Future<allPosts> getPosts() async {
    

    QuerySnapshot<Object?> posts;
    posts = await postCollection.get().then((value) {
      update();
      return value;
      
    });
    

    return  allPosts.fromJson(posts);
  }

  Future<void> addLike({required String postId}) async {
    postCollection.doc(postId).collection('Likes').doc(userId).set({
      'like': true,
    }).then((value) {
      update();
    });
  }

  List<bool> isliked = [];
  List<int> numLikes = [];

  Future<void> getNumLikes({required String postId}) async {
    postCollection.doc(postId).collection('Likes').get().then((value) {
      bool flag = false;
      value.docs.map((doc) {
        if (doc.id == userId) {
          flag = true;
        }
      });
      isliked.add(flag);
      numLikes.add(value.docs.length ?? 0);
      print('@@@@@@@@@@@@@@@@@@@@@@@@@');
      print(value.docs.length);
      print(flag);
      update();
    });
  }

  Future<void> removeLike({required String postId}) async {
    postCollection.doc(postId).collection('Likes').doc(userId).delete();
    update();
  }

  @override
  Future<void> onInit() async {
    postCollection = FirebaseFirestore.instance.collection('posts');
    super.onInit();
  }
}
