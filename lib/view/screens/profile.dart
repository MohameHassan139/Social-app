import 'package:flutter/material.dart';
import 'package:social_app/constants/app_routes.dart';
import 'package:social_app/helper/cashe_helper.dart';
import '../../controller/profile_controller.dart';
import '../../model/user_model.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({key});
  profileController controller = Get.put(profileController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: controller.doc.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          controller.model = UserDataModel.fromJson(
              snapshot.data!.data() as Map<String, dynamic>);
          CacheHelper.addUserDataToPrefs(userModel: controller.model);
          CacheHelper.getUserDataFromPrefs();
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
                            borderRadius: const BorderRadius.only(
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
                const SizedBox(
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
                              const SizedBox(
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
                              const SizedBox(
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
                              const SizedBox(
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
                              const SizedBox(
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
                          // Get.to(() =>EditeProfile());
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
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
