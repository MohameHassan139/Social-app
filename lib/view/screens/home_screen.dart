import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/constants/them/app_color.dart';
import '../../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({key});
  @override
  Widget build(BuildContext context) {
    BottonNavController controller = Get.put(BottonNavController());
    return GetBuilder<BottonNavController>(
      builder: (c) => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                // TODO
              },
              icon: const Icon(
                Icons.notifications_active_rounded,
                color: AppColor.buttonColor,
              ),
            ),
            IconButton(
              onPressed: () {
                // TODO
              },
              icon: const Icon(
                Icons.search,
              ),
            ),
          ],
          title: Text(controller.title[controller.currentIndex]),
        ),
        body: controller.screens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_sharp),
              label: 'chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.upload_file),
              label: 'add post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_history_outlined),
              label: 'user',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'settings',
            ),
          ],
          currentIndex: controller.currentIndex,
          onTap: (value) {
            controller.chanageBottomNavBar(value);
          },
        ),
      ),
    );
  }
}
