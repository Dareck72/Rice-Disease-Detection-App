import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';
import 'package:monlikountche/App/services/uploadData.dart';

class Historycontroller extends GetxController {
  Logincontroller logincontroller = Get.find<Logincontroller>();  
  @override
  void onInit() {
    print("entré dans la fonction onInit du controller de l'historique");
    logincontroller.access_token.isNotEmpty ? getData() : getLocalData();
    super.onInit();
  }

  RxList data = [].obs;
  RxBool isloading = false.obs;

  getData() async {
    isloading.value = true;
    data.clear();
    data.value = await uploadData().getHistoryData();
    isloading.value = false;
    print(data);
  }

  getLocalData() async {
    isloading.value = true;
    print("entré dans la fonction de récupération de l'historique local");
    var localData = await uploadData().GetLocalData();
    data.value = localData;
    print("donnée local récupérée : $localData");
    isloading.value = false;
  }

  datetimeTOString(String Date) async {
   DateTime  data = DateTime.parse(Date);
   
  }
}
