import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/resultController.dart';

class Resultbinding extends  Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Resultcontroller());
  }
}