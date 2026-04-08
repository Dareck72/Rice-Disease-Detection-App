import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/registerController.dart';

class Registerbindings  extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<Registercontroller>(() => Registercontroller());
  }
}