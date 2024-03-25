import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_api_app/app/modules/login/controllers/login_controller.dart';
import 'package:test_api_app/app/modules/widgets/text_form_field_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                ///EMAIL
                TextFormFieldWidget(
                    hintText: "email",
                    textEditingController: controller.emailEditingController,
                    validatorFun: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      }

                      const pattern =
                          r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
                          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
                          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
                          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
                          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
                          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
                          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
                      final regex = RegExp(pattern);

                      if (value!.isNotEmpty && !regex.hasMatch(value)) {
                        return "Enter a valid email address";
                      }

                      return null;
                    }),
                SizedBox(
                  height: Get.height * 0.02,
                ),

                ///PASSWORD
                TextFormFieldWidget(
                    hintText: "password",
                    textEditingController: controller.passwordEditingController,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => {
                          if (controller.formKey.currentState!.validate())
                            {controller.handleSubmit()}
                        },
                    validatorFun: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    }),
                SizedBox(
                  height: Get.height * 0.02,
                ),

                ///SUBMIT
                ElevatedButton(
                    onPressed: () {
                      controller.handleSubmit();
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ));
  }
}
