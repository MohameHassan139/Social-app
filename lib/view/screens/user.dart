import 'package:flutter/material.dart';
import 'package:social_app/constants/app_routes.dart';
import 'package:social_app/constants/const.dart';

import '../../controller/home_controller.dart';
import '../../controller/setting_controller.dart';
import '../../helper/cashe_helper.dart';
import '../../model/user_model.dart';
import '../widgets/custom_button.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserScreen extends StatelessWidget {
  UserScreen({key});
  SettingController controller = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: controller.doc?.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          controller.model = UserDataModel.fromJson(
              snapshot.data!.data() as Map<String, dynamic>);

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // background and profile images
                Container(
                  height: 190,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      // background image
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                        child: Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                            image: DecorationImage(
                              image: NetworkImage('${controller.model.caver}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),

                      // profile image
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              '${controller.model.image}',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // user name
                Text(
                  '${controller.model.name}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 7,
                ),
                // bio
                Text(
                  '${controller.model.bio}',
                  style: Theme.of(context).textTheme.caption,
                ),

                //posts

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO
                          },
                          child: Column(
                            children: [
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'posts',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO
                          },
                          child: Column(
                            children: [
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'friends',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO
                          },
                          child: Column(
                            children: [
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'followers',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            // TODO
                          },
                          child: Column(
                            children: [
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text(
                                'followings',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('ADD PHOTO'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 35,
                      child: OutlinedButton(
                        onPressed: () {
                          Get.toNamed(AppRoutes.editeProfile);
                        },
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}









