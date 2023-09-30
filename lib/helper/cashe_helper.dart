import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class CacheHelper {
  static SharedPreferences? prefs;

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static testSharedPreferences() async {
    print('token  ${prefs?.getString('token')}');
    print('user_id  ${prefs?.getString('user_id')}');
    print('labels  ${prefs?.getString('labels')}');
  }

  static Future<void> addUserDataToPrefs( {required UserDataModel userModel}) async {
    prefs?.setString('userName', userModel.name!);
    prefs?.setString('userImage', userModel.image!);
    prefs?.setString('userBio', userModel.bio!);
    prefs?.setString('userCaver', userModel.caver!);
    prefs?.setString('userEmail', userModel.email!);
    prefs?.setString('userPhone', userModel.phone!);
  }

  static UserDataModel getUserDataFromPrefs() {
    UserDataModel userModel = UserDataModel();
    userModel.name = prefs?.getString('userName');
    userModel.image = prefs?.getString('userImage');
    userModel.bio = prefs?.getString('userBio');
    userModel.caver = prefs?.getString('userCaver');
    userModel.email = prefs?.getString('userEmail');
    userModel.phone = prefs?.getString('userPhone');
    return userModel;
  }
}
