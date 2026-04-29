import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/geolocationController.dart';
import 'package:monlikountche/App/modules/models/userModel.dart';
import 'package:monlikountche/App/services/authService.dart';

class Registercontroller extends GetxController {
  TextEditingController fistnameController = TextEditingController();

  TextEditingController lastnameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController comfpassControler = TextEditingController();
  Geolocationcontroller geolocation = Get.find<Geolocationcontroller>();

  RxBool ObscurePass = true.obs;
  RxBool ObscureComfPass = true.obs;
  RxBool loading = false.obs;
  register() async {
    await 
      AuthService().userSignIn(
        Usermodel(
          nom: fistnameController.text,
          prenom: lastnameController.text,
          email: emailController.text,
          password: passwordController.text,
          sex: "",
          localisation: "Lon: ${geolocation.long} , Lat: ${geolocation.late}"
        )
      );
 
  }
}
