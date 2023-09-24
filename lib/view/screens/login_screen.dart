import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../constants/them/app_color.dart';
import '../../constants/app_routes.dart';
import '../../controller/login_controller.dart';
import '../../functions/valid_input.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textformfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({key});

  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 263, 10, 269),
          width: double.infinity,
          color: AppColor.backgroundColor,
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 1, 41),
                  child: const Text(
                    'Log-in',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 30,
                    ),
                  ),
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.email_outlined),
                  labelText: 'E-mail',
                  hintText: 'E-mail',
                  textController: controller.emailController,
                  validator: (value) {
                    return validInput(value!, 5, 100, 'email');
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                GetBuilder<LoginController>(
                    builder: (c) => CustomTextFormField(
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          labelText: 'Password',
                          hintText: 'Password',
                          ispassword: controller.isPassword,
                          suffix: IconButton(
                            onPressed: () {
                              controller.showPassword();
                            },
                            icon: Icon(controller.icon),
                          ),
                          textController: controller.passwordController,
                          validator: (value) {
                            return validInput(value!, 5, 100, 'password');
                          },
                        )),
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 134, right: 134),
                  child: GetBuilder<LoginController>(
                    builder: (c) => ConditionalBuilder(
                      condition: controller.state.isTrue,
                      builder: (context) => CustomButton(
                        textButton: 'Submit',
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            controller.onSubmit(
                              email: controller.emailController.text,
                              password: controller.passwordController.text,
                            );
                          }
                        },
                      ),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                  ),
                ),
                Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'If you don’t have an account please',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              color: Color(0xff000000)),
                        ),
                        TextButton(
                          // function
                          onPressed: () {
                            Get.toNamed(AppRoutes.register);
                          },

                          child: const Text(
                            'Register',
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
                // Spacer(),
                const SizedBox(
                  height: 150,
                ),
                GetBuilder<LoginController>(
                  builder: (c) => ConditionalBuilder(
                    condition: c.isverfied,
                    builder: (context) => Container(
                      color: Colors.amber[600],
                      height: 50,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            const Text('verfiay your email '),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                FirebaseAuth.instance.currentUser
                                    ?.sendEmailVerification();
                              },
                              child: const Text(
                                'send ',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    fallback: (context) => const Text(''),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



//    mohamedhessan139@gmail.com

//   mohamedhessan139@gmail.com