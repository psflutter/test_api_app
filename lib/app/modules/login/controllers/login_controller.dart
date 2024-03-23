import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_api_app/app/repositories/login_repository.dart';
import 'package:test_api_app/app/routes/app_pages.dart';

class LoginController extends GetxController {
  late LoginRepository _loginRepository;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  LoginController() {
    _loginRepository = LoginRepository();
  }
  @override
  void onInit() {
    
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  handleSubmit() async {
    if (formKey.currentState!.validate()) {
      Map<String, dynamic> requestBody = {
        "email": emailEditingController.text.toString(),
        // "eve.holt@reqres.in",
        "password": passwordEditingController.text.toString()
        // "cityslicka"
      };
      var token = await _loginRepository.postApi(requestBody);

      if (token != null) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("", "${token["error"]}");
      }
    }
  }
}
