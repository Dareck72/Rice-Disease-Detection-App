import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/geolocationController.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';
import 'package:monlikountche/App/modules/controllers/resultController.dart';
import 'package:monlikountche/App/modules/routes/appPage.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';
import 'package:timeago/timeago.dart' as timeago;


void main() async {
   timeago.setLocaleMessages('fr', timeago.FrMessages());
  WidgetsFlutterBinding.ensureInitialized(); // obligatoire avant tout async
  Get.put<Geolocationcontroller>(Geolocationcontroller());
  Get.put<Logincontroller>(Logincontroller());
  Get.put<Resultcontroller>(Resultcontroller());
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      initialRoute: approute.register,
      getPages: AppPage.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
