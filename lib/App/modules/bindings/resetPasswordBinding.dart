import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/resetPasswordController.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController());
  }
}