import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monlikountche/App/modules/controllers/historyController.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';

class HistoryView extends GetView<Historycontroller> {
  @override
  Widget build(BuildContext context) {


  Logincontroller logincontroller = Get.find<Logincontroller>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
     
      logincontroller.access_token.isNotEmpty ? controller.getData() : controller.getLocalData();
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,

        child: Column(
          children: [
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
                ),

                IconButton(
                  onPressed: () {
                    print("");
                  },
                  icon: Icon(Icons.more_vert),
                ),
              ],
            ),

            Obx(
              () => controller.isloading.value
                  ? Center(
                      child: LoadingAnimationWidget.bouncingBall(
                        color: Colors.green,
                        size: 50,
                      ),
                    )
                  : Expanded(
                      child: Container(
                        child: ListView.separated(
                          shrinkWrap: true,

                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                width: 55,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                      255,
                                      142,
                                      137,
                                      137,
                                    ),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Obx(
                                  () => ClipOval(
                                    child:  logincontroller.access_token.isNotEmpty ? Image.network(
                                      controller.data[index]["image_path"],
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    ): Image.file(File( controller.data[index]["image_path"]),
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                    ),
                                  ),
                                ),
                              ),
                              titleTextStyle: GoogleFonts.istokWeb(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Colors.black,
                              ),
                              title: Text('Il y as :'),
                              subtitle: Obx(
                                () => Text(
                                  "Maladie détecté : ${controller.data[index]["disease_name"]} ",
                                ),
                              ),
                            );
                          },

                          separatorBuilder: (context, index) {
                            return SizedBox(height: 20);
                          },

                          itemCount: controller.data.length,
                        ),
                      ),


                    ),
            ),
          ],
        ),
      ),
    );
  }
}
