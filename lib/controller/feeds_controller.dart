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
  late AllPosts postsList;

  late CollectionReference postCollection;
  String? userId = CacheHelper.prefs?.getString('userId');
  UserDataModel userDataModel = UserDataModel();

  Future<AllPosts> getPosts() async {
    QuerySnapshot<Object?> posts;

    posts = await postCollection.get().then((value1) {
      _fetchLikes(value1).then((value) {
        posts = value1;
        update();
      });
      return value1;
    });

    return AllPosts.fromSnapshot(posts);
  }

  List<bool> isliked = [];
  List<int> numLikes = [];
  Future<void> _fetchLikes(QuerySnapshot<Object?> snapshot) async {
    print('Fetching likes...');
    isliked = List.generate(snapshot.docs.length, (_) => false);
    numLikes = List.generate(snapshot.docs.length, (_) => 0);

    try {
      for (int i = 0; i < snapshot.docs.length; i++) {
        final postDoc = snapshot.docs[i];
        final likesQuerySnapshot =
            await postDoc.reference.collection('Likes').get();
        final isLiked = likesQuerySnapshot.docs.any((doc) => doc.id == userId);

        isliked[i] = isLiked;
        numLikes[i] = likesQuerySnapshot.docs.length;

        print('Likes for post ${i + 1}: ${numLikes[i]}');
        print('Is liked by user: ${isliked[i]}');
      }
    } catch (error) {
      // Handle any errors that occur during the query.
      print('Error fetching likes: $error');
    }
  }

  Future<void> addLike({required String postId}) async {
    postCollection.doc(postId).collection('Likes').doc(userId).set({
      'like': true,
    }).then((value) {
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
