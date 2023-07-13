
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/them/app_color.dart';
import '../../controller/register_controller.dart';
import '../../functions/valid_input.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({key});

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    // final DateTime? picked = await showDatePicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: DateTime(1900),
    //   lastDate: DateTime.now(),
    // );
    // print(selectedDate);

    // if (picked != null && picked != selectedDate) {
    //   selectedDate = picked;
    //   controller.refresh();
    // }
    print('uijuiiji$selectedDate');

    controller.refresh();
  }

  RegisterController controller = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 150, 15, 195),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 17),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                    ),
                  ),
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.person_outline),
                  labelText: 'Name',
                  hintText: 'Name',
                  fieldType: TextInputType.name,
                  textController: controller.nameTextController,
                  validator: (value) {
                    return validInput(value!, 3, 100, 'username');
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                    prefixIcon: const Icon(Icons.email_outlined),
                    labelText: 'E-mail',
                    validator: (value) {
                      return validInput(value!, 5, 100, 'email');
                    },
                    hintText: 'E-mail',
                    textController: controller.emailTextController),
                const SizedBox(height: 10),
                CustomTextFormField(
                    validator: (value) {
                      return validInput(value!, 4, 100, 'phone');
                    },
                    labelText: 'phone',
                    hintText: 'phone',
                    fieldType: TextInputType.phone,
                    textController: controller.phoneTextController),
                const SizedBox(height: 10),
                
                
                
                
                Container(
                  width: double.infinity,
                  child: GetBuilder<RegisterController>(
                    builder: (c) => SizedBox(
                      // height: 55,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                prefixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                labelText: 'Password',
                                ispassword: controller.isPassword,
                                suffix: IconButton(
                                  onPressed: () {
                                    controller.showPassword();
                                  },
                                  icon: Icon(controller.icon),
                                ),
                                validator: (value) {
                                  return validInput(value!, 8, 100, 'password');
                                },
                                hintText: 'Password',
                                textController:
                                    controller.passwordTextController),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: CustomTextFormField(
                                prefixIcon:
                                    const Icon(Icons.lock_outline_rounded),
                                labelText: 'Passwoed',
                                ispassword: controller.isPassword,
                                suffix: IconButton(
                                  onPressed: () {
                                    controller.showPassword();
                                  },
                                  icon: Icon(controller.icon),
                                ),
                                validator: (value) {
                                  return validInput(value!, 8, 100, 'password');
                                },
                                hintText: 'Password',
                                textController:
                                    controller.rePasswordTextController),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: GetBuilder<RegisterController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state.isTrue,
                      builder: (context) {
                        return CustomButton(
                          textButton: 'Submit',
                          onPressed: () async {
                            var res2 = await controller.signUp();

                            // print('\nfrom screen-------  $res2');
                          },
                        );
                      },
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.fromLTRB(52, 0, 57, 0),
                  // width: double.infinity,

                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'If you already have an account please',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1,
                            color: Color(0xff000000),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            controller.goToLogin();
                          },
                          child: const Text(
                            'log-in',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 1,
                              color: Color(0xff3356d2),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
