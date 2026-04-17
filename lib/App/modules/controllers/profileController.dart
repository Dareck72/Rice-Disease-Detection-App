import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/services/authService.dart';

class Profilecontroller extends GetxController {
  

  TextEditingController updateEmailController = TextEditingController();
  TextEditingController updateNomController = TextEditingController();
  RxBool loading = false.obs;



  dataUpdate() async {
    await Future.delayed(Duration(seconds: 6), () {
      AuthService().userlogin(
        updateEmailController.text,
        updateNomController.text,
      );
    });
  }


}
