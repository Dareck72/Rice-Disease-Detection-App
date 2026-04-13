import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monlikountche/App/modules/controllers/homeController.dart';
import 'package:monlikountche/App/modules/controllers/resultController.dart';

class Resultviews extends GetView<Resultcontroller> {
  Homecontroller homeController = Get.find<Homecontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  if (homeController.data != null)
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: Image.file(
                        File(homeController.data!.path),
                        fit: BoxFit.cover,
                      ),
                    ),

                  Positioned(
                  left: 10,
                    top: 10,
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(Icons.arrow_back,color: const Color.fromARGB(255, 255, 255, 255),size: 35,),
                    ),
                  ),
                ],
              ),
            ),
          Container(
            padding: EdgeInsets.only(left: 25,top: 30),
            child: Row(
              children: [
                Text("Symptome",style: TextStyle(
                  color: Color(0xFF045435),fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
               const SizedBox(width: 2,),
               IconButton(onPressed: (){}, icon: Icon(Icons.volume_up,color: Color(0xFF045435),size: 30,))

              ],
            ),
          )
          
          
          ],
        ),
      ),
    );
  }
}
