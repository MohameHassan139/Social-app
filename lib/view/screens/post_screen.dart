import 'package:flutter/material.dart';
import 'package:social_app/controller/create_post_controller.dart';
import '../../model/user_model.dart';
import 'package:get/get.dart';

class CreatePostScreen extends StatelessWidget {
  UserDataModel userModel = UserDataModel();

  CreatePostController controller = Get.put(CreatePostController());

  CreatePostScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Post',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          TextButton(
            onPressed: () {
              controller
                  .addPost(
                dateTime: DateTime.now().toString(),
                name: userModel.name,
                text: controller.postController.text,
                uesrId: controller.uesrId,
                image: userModel.image,
              )
                  .then((value) {
                controller.removePostImage();
                controller.postController.clear();
                controller.postUrl = null;
              });
            },
            child: const Text('Post'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GetBuilder<CreatePostController>(
          builder: (c) => Column(
            children: [
              if (c.uploading) const LinearProgressIndicator(),
              if (c.uploading)
                const SizedBox(
                  height: 10,
                ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage('${userModel.image!}'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      '${userModel.name!}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TextField(
                  controller: controller.postController,
                  decoration: const InputDecoration(
                    hintText: 'whate is in your mind',
                    border: InputBorder.none,
                  ),
                  maxLines: 100,
                ),
              ),
              if (controller.postImage != null)
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
                            image: FileImage(controller.postImage!),
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
                              controller.removePostImage();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      controller.getpostImage();
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.image_rounded),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Add Picture')
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO
                    },
                    child: const Text('# Add Tag'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
