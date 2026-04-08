import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/homeController.dart';

class Homebinding  extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<Homecontroller>(() => Homecontroller());
  }
}