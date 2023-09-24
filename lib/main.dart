import 'package:flutter/material.dart';
import 'package:social_app/constants/app_routes.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/helper/cashe_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'constants/them/dark_mode.dart';
import 'constants/them/light_mode.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String? uesrId = CacheHelper.prefs?.getString('userId');
    print(uesrId);

    print('#######################################');

    return GetMaterialApp(
      theme: lightThem(),
      darkTheme: darktThem(),
      themeMode: ThemeMode.light,
      // themeMode: ThemeMode.dark,

      routes: routes,
      // initialRoute: AppRoutes.home,
      initialRoute: uesrId == null ? AppRoutes.login : AppRoutes.home,
      // initialRoute: AppRoutes.editeProfile,
    );
  }
}
//  mohassen011@gmail.com
//    mohamedhessan139@gmail.com
// 123456@Aa 