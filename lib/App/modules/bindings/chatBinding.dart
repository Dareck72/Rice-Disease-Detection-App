import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/chatController.dart';

class ChatBotBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>chatController());
  }
}


