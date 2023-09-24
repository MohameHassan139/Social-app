import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/constants/them/app_color.dart';

ThemeData lightThem() {
  return ThemeData(
    
    primarySwatch: Colors.green,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black,
        
      ),
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white10,
        statusBarIconBrightness: Brightness.light,
      ),

      titleSpacing: 20,
      titleTextStyle: TextStyle(
        
        
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      subtitle1:TextStyle(
        color: Colors.black,
        fontSize: 16,
      ), 
      bodyText1: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: AppColor.buttonColor,
      ),
      elevation: 20,
    ),
  );
}
