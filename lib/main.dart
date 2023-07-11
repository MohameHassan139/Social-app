import 'package:flutter/material.dart';
import 'package:social_app/constants/app_routes.dart';
import 'package:social_app/constants/const.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/view/screens/login_screen.dart';
import 'package:social_app/view/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: routes,
      initialRoute:uesrId== null? AppRoutes.login:AppRoutes.home,
    );
  }
}
//  mohassen011@gmail.com