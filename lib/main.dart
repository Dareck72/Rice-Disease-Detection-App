import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/geolocationController.dart';
import 'package:monlikountche/App/modules/routes/appPage.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // obligatoire avant tout async
  Get.put<Geolocationcontroller>(Geolocationcontroller());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: approute.register,
      getPages: AppPage.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
