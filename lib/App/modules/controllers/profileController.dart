import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';
import 'package:monlikountche/App/services/authService.dart';
import 'package:monlikountche/App/services/userServices.dart';

class Profilecontroller extends GetxController {
  @override
  void onReady() {
    print("entré dans la fonction onReady du controller du profile");
    super.onReady();
    setUserData();
  }

  TextEditingController updatePrenomController = TextEditingController();
  TextEditingController updateNomController = TextEditingController();

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordConfirmController = TextEditingController();

  RxBool oldObcurText = false.obs;
  RxBool newObcurText = false.obs;

  RxBool loading = false.obs;
  var userData = {}.obs;
  RxString nom = "".obs;
  RxString prenom = "".obs;
  RxString email = "".obs;
  var data;

  dataUpdate() async {
    await Future.delayed(Duration(seconds: 6), () {
      AuthService().UserUpdate(
        updateNomController.text,
        updatePrenomController.text,
      );
    });
  }

  setUserData() async {
    userData.value = await currentUser().getUser();
    nom.value = userData.value['nom'] ?? "";
    prenom.value = userData.value['prenoms'] ?? "";
    email.value = userData.value['email'] ?? "";
    print("User data in controller: $nom $prenom");
  }

  updateUserPassword( formkey) async {
   
      data =  await AuthService().Updatepassord(
        oldPasswordController.text,
        newPasswordController.text,
        newPasswordConfirmController.text,formkey
      );

   

    print("Data returned from Updatepassord: ${data["message"]}");
  }

  
   Future<void>  raffraichir ( String loginAcess) async {
    
    
    if(loginAcess.isNotEmpty){
      print("Login access: $loginAcess");
      await Future.delayed(Duration(seconds: 2),(){
        setUserData();
        });
    }
 

  }




}
