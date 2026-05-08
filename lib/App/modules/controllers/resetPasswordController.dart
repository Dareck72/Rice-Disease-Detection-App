import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';
import 'package:monlikountche/App/services/authService.dart';

class ResetPasswordController extends GetxController {
  TextEditingController codeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Logincontroller logincontroller = Get.find<Logincontroller>();

  RxBool obscureValue = false.obs;
  RxBool loading = false.obs;

  resetPassword(GlobalKey<FormState> formkey) async {
    print("Entrez dans la foncion du reset");
    print("${logincontroller.forgotPasswordEmailController.text}");
    await AuthService().resetPassword(
      logincontroller.forgotPasswordEmailController.text,
      codeController.text,
      newPasswordController.text,
      confirmPasswordController.text,formkey
    );
    print("${codeController.text}");

  }
}
