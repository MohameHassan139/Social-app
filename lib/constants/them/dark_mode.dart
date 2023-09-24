import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/constants/them/app_color.dart';

ThemeData darktThem() {
  return ThemeData(
    primarySwatch: Colors.green,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
      color: Colors.black87,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.black45,
        statusBarIconBrightness: Brightness.light,
      ),
      titleSpacing: 20,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(color: Colors.grey[350]),
      bodySmall:TextStyle(color: Colors.grey[350]),
      titleMedium: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
      bodyLarge: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(241, 2, 5, 23),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),

      selectedIconTheme: IconThemeData(
        color: AppColor.buttonColor,
      ),
      unselectedLabelStyle: TextStyle(color: Colors.white) ,
      elevation: 20,
    ),
    cardTheme: const CardTheme(color: Colors.black,),
    iconTheme:IconThemeData(color: Colors.grey[350],) ,
    outlinedButtonTheme:  const OutlinedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(Colors.green),
      )
    )
  );
  
}
