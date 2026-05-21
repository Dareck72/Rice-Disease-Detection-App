import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/bindings/ProfileBinding.dart';
import 'package:monlikountche/App/modules/bindings/homeBinding.dart';
import 'package:monlikountche/App/modules/controllers/swithController.dart';
import 'package:monlikountche/App/modules/views/homeViews.dart';
import 'package:monlikountche/App/modules/views/profileViews.dart';

class Swithview extends GetView<Swithcontroller> {
  @override
  Widget build(BuildContext context) {
    final List page = [Homeviews(), Profileviews()];

    Homebinding().dependencies();
    ProfileBinding().dependencies();

    return Scaffold(
      body: Obx(() => page[controller.pageIndex.value]),

      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((State) {
            if (State.contains(WidgetState.selected)) {
              return TextStyle(
                color: Color(0xFF05C98A),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              );
            }
            return TextStyle(
              color: Color.fromARGB(255, 6, 6, 6),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            );
          }),
        ),
        child: Obx(
          () => NavigationBar(
            indicatorColor: Color.fromARGB(255, 177, 202, 194),
            surfaceTintColor: Color.fromARGB(255, 215, 215, 216),
            elevation: 10,
            // labelTextStyle: ,
            selectedIndex: controller.pageIndex.value,
            onDestinationSelected: (index) {
              controller.pageIndex.value = index;
            },
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                label: '',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle_outlined),
                label: ''
              ),
            ],
          ),
        ),
      ),
    );
 
  }
}
