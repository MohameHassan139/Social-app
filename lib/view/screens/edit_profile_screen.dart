import 'dart:io';
import 'dart:html' as html;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../controller/setting_controller.dart';
import '../../model/user_model.dart';
import '../widgets/custom_textformfield.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditeProfile extends StatelessWidget {
  EditeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          TextButton(
              onPressed: () {
                controller.uploadProfileImage();
                // TODO
              },
              child: const Text('Update')),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: controller.doc?.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            controller.model = UserDataModel.fromJson(
                snapshot.data!.data() as Map<String, dynamic>);
            controller.nameController.text = controller.model.name;
            controller.bioController.text = controller.model.bio!;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                GetBuilder<SettingController>(
                  builder: (c) => Container(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        // background image
                        Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                  ),
                                  image: DecorationImage(
                                    image: controller.backgroundImage != null
                                        ? FileImage(File(
                                            controller.backgroundImage!.path))
                                        : NetworkImage(
                                                '${controller.model.caver}')
                                            as ImageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  child: IconButton(
                                    onPressed: () {
                                      controller.getbackgroundImage();
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // profile image
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: controller.profileImage !=
                                          null
                                      ? FileImage(controller.profileImage!)
                                      : NetworkImage(
                                          '${controller.model.image}',
                                        ) as ImageProvider,
                                ),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              child: IconButton(
                                onPressed: () {
                                  controller.getprofileImage();
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: 'Edite Name',
                  labelText: 'Edite Name',
                  textController: controller.nameController,
                  fieldType: TextInputType.name,
                  prefixIcon: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hintText: 'Edite Bio',
                  labelText: 'Edite Bio',
                  textController: controller.bioController,
                  fieldType: TextInputType.text,
                  prefixIcon: const Icon(Icons.info_outlined),
                ),
              ]),
            );
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong..."));
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Center(child: Text("Document does not exist..."));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
