import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/routes/appPage.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: approute.swith,
        getPages: AppPage.routes,
        debugShowCheckedModeBanner: false,
    );
  }
}
