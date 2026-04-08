import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';

class Loginbindings  extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<Logincontroller>(() => Logincontroller());
  }
}