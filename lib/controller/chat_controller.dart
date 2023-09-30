import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/cashe_helper.dart';
import '../model/user_model.dart';

class ChatController extends GetxController {
  String? uesrId = CacheHelper.prefs?.getString('userId');
  List<UserDataModel> chatUsers = [];
  bool getChatUserState = true;


  Future<void> getChatUser() async {
    getChatUserState = false;
    update();

    

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      // Convert the QuerySnapshot to a List of DocumentSnapshots
      final docs = querySnapshot.docs;

      // Iterate through the documents and add matching users to the chatUsers list
      for (final doc in docs) {
        final userData =
            UserDataModel.fromJson(doc.data() as Map<String, dynamic>);
        if (doc.id != uesrId) {
          chatUsers.add(userData);
        }
      }

      getChatUserState = true;
      update();
    } catch (error) {
      // Handle any errors that occur during the query.
      print('Error fetching chat users: $error');
    }
  }


  @override
  void onInit() async {
    getChatUser();
    super.onInit();
  }
}
