import 'package:get/get.dart';
import 'package:monlikountche/App/modules/models/dataModel.dart';
import 'package:monlikountche/App/services/uploadData.dart';

class Historycontroller extends GetxController {
  @override
  void onInit() {
    print("entré dans la fonction onInit du controller de l'historique");
    getData();
    super.onInit();
  }

 RxList<DataModel> data=<DataModel>[].obs;

  getData() async {
   data.add(DataModel.fromjson(await uploadData().getHistoryData()));

    print(data);
  }
}
