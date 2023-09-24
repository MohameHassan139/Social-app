import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:social_app/constants/app_routes.dart';
// import 'package:image_picker/image_picker.dart';
import '../../controller/profile_controller.dart';
// import '../../model/user_model.dart';
import '../widgets/custom_textformfield.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class EditeProfile extends StatelessWidget {
  EditeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    profileController controller = Get.put(profileController());
    controller.nameController.text = controller.model.name!;
    controller.bioController.text = controller.model.bio!;
    controller.phoneController.text = controller.model.phone!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          TextButton(
              onPressed: () {
                controller
                    .uploadUserinfo(
                  bio: controller.bioController.text,
                  name: controller.nameController.text,
                  phone: controller.phoneController.text,
                  cover: controller.coverUrl,
                  image: controller.profileUrl,
                )
                    .then((value) {
                  
                });
              },
              child: const Text('Update')),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<profileController>(
          builder: (c) => Column(children: [
            if (c.uploading) const LinearProgressIndicator(),
            if (c.uploading)
              const SizedBox(
                height: 10,
              ),
            Container(
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
                                  ? FileImage(
                                      File(controller.backgroundImage!.path))
                                  : NetworkImage('${controller.model.caver}')
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
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: controller.profileImage == null
                                ? NetworkImage(controller.model.image!)
                                : FileImage(controller.profileImage!)
                                    as ImageProvider,
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
            const SizedBox(
              height: 10,
            ),
            CustomTextFormField(
              hintText: 'Edite Phone',
              labelText: 'Edite Phone',
              textController: controller.phoneController,
              fieldType: TextInputType.number,
              prefixIcon: const Icon(Icons.phone),
            ),
            const SizedBox(
              height: 30,
            ),
          ]),
        ),
      ),
    );
  }
}
