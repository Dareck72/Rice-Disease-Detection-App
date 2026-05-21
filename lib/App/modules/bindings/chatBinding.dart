import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/chatController.dart';

class ChatBinding extends  Bindings{

@override
  void dependencies() {
   Get.lazyPut<chatController>(()=>chatController());
  }


}