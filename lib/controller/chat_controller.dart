import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helper/cashe_helper.dart';
import '../model/user_model.dart';

class ChatController extends GetxController {
  String? uesrId = CacheHelper.prefs?.getString('userId');
  List<UserDataModel> chatUsers = [];
  
  void getChatUser() {
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.map((e) {
        if (e.id != uesrId) {
          chatUsers.add(UserDataModel.fromJson(e as Map<String, dynamic>));
        }
      });
     
    });
  }

}
