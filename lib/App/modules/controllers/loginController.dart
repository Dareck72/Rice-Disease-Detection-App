import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/services/authService.dart';

class Logincontroller extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool loading = false.obs;
  RxBool obscureValue = false.obs;

  login() async {
    await Future.delayed(Duration(seconds: 7), () {
      AuthService().userlogin(emailController.text, passwordController.text);
    });
  }
}
