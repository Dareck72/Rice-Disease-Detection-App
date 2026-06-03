import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/services/authService.dart';

class Logincontroller extends GetxController
 {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotPasswordEmailController = TextEditingController();

  RxBool dialogLoading = false.obs;
  RxBool loading = false.obs;
  RxBool obscureValue = false.obs;
  RxString access_token = "".obs;


 login() async {
    access_token.value = await AuthService().userlogin(

      emailController.text,
      passwordController.text,
   
    ) ;
    print("Le token d'accès est : ${access_token.value}");
  }


  forgotPassword() async {
    await AuthService().forgotPassword(forgotPasswordEmailController.text);
  }


}
