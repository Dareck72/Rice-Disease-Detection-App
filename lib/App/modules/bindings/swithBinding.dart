import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/swithController.dart';

class Swithbinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<Swithcontroller>(() => Swithcontroller());
  }
}