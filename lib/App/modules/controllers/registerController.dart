import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/services/authService.dart';

class Registercontroller extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController comfpassControler = TextEditingController();

  RxBool ObscurePass = true.obs;
  RxBool ObscureComfPass = true.obs;
  RxBool loading = false.obs;
  login() async {
    await Future.delayed(Duration(seconds: 6), () {
      AuthService().userSignIn(
        emailController.text,
        passwordController.text,
        nameController.text,
      );
    });
  }
}
