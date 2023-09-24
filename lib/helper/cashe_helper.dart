import 'package:shared_preferences/shared_preferences.dart';

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
}
