import 'package:get/get.dart';
import '../helper/cashe_helper.dart';
import '../model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SettingController extends GetxController {
  late UserDataModel model;
  String? uesrId;
  CollectionReference? users;
  DocumentReference? doc;

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
