import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/setting_controller.dart';
import '../widgets/custom_textformfield.dart';

class EditeProfile extends StatelessWidget {
  const EditeProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    TextEditingController nameController = TextEditingController();
    TextEditingController bioController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          TextButton(
              onPressed: () {
                // TODO
              },
              child: const Text('Update')),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
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
                            image: NetworkImage('${controller.model.caver}'),
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
                              // TODO
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
                          backgroundImage: NetworkImage(
                            '${controller.model.image}',
                          ),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 20,
                      child: IconButton(
                      onPressed: () {
                        // TODO
                      },
                      icon:  const Icon(
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
          SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            hintText: 'Edite Name',
            labelText: 'Edite Name',
            textController: nameController,
            fieldType: TextInputType.name,
            prefixIcon: const Icon(Icons.person),
          ),
        ]),
      ),
    );
  }
}
