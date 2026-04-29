import 'package:get/get.dart';
import 'package:monlikountche/App/modules/models/dataModel.dart';
import 'package:monlikountche/App/services/uploadData.dart';

class Historycontroller extends GetxController {
  RxList historyList = [].obs;

  getData() {
    historyList.add(DataModel.fromjson(uploadData().getHistoryData()));
  }
}
