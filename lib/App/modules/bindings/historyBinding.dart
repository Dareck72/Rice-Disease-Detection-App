import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/historyController.dart';

class Historybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>Historycontroller());
  }
}
