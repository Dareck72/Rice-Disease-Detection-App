import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monlikountche/App/modules/controllers/historyController.dart';
import 'package:monlikountche/App/modules/controllers/resultController.dart';

class HistoryView extends GetView<Historycontroller> {
  @override
  
  Widget build(BuildContext context) {

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

            const SizedBox(height: 30),

            Expanded(
              child: Container(
                color: Colors.amber,
                child: ListView.separated(
                  shrinkWrap: true,


                  itemBuilder: (context, index) {
                    
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Obx(()=> Image.file(File(controller.data[index].image_path.path))),
                      ),
                      titleTextStyle: GoogleFonts.istokWeb(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                      title: Text('Il y as :'),
                      subtitle: Obx(() => Text("Maladie détecté : ${File(controller.data[index].disease_name)}")),
                      subtitleTextStyle: TextStyle(),
                    );
                  
                  },

                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20);
                  },

                  itemCount: controller.data.length,

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
