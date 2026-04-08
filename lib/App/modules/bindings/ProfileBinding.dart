import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/profileController.dart';

class ProfileBinding  extends  Bindings{

@override
  void dependencies() {

Get.lazyPut<Profilecontroller>(() => Profilecontroller());
  }

}
