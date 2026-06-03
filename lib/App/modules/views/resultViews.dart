import 'dart:io';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monlikountche/App/modules/controllers/chatController.dart';
import 'package:monlikountche/App/modules/controllers/homeController.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';
import 'package:monlikountche/App/modules/controllers/resultController.dart';

class Resultviews extends GetView<Resultcontroller> {
  Homecontroller homeController = Get.find<Homecontroller>();
  Logincontroller loginController = Get.find<Logincontroller>();
  final chatController controler = Get.put(chatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // Pour la parties de l'image
            Container(
              child: Stack(
                children: [
                  if (homeController.data != null)
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      height: 250,
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
                      icon: Icon(
                        Icons.arrow_back,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        size: 35,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            loginController.access_token.isNotEmpty
                ? Expanded(
                    child: Container(
                      child:
                          controller.riceLeafDetectionResult.value !=
                              "Pas une image de riz"
                          ? ListView(
                              children: [
                                // La maladie détecté et
                                Container(
                                  padding: EdgeInsets.only(left: 25, top: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),

                                          color: Color(0xFF045435),
                                        ),
                                        child: Text(
                                          "Maladie detectée",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              238,
                                              240,
                                              239,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          controller.disease.value,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              230,
                                              57,
                                              48,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                //  la probabilité
                                Container(
                                  padding: EdgeInsets.only(left: 25, top: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),

                                          color: Color(0xFF045435),
                                        ),
                                        child: Text(
                                          "Fiabilité",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              238,
                                              240,
                                              239,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          "${controller.maxProb.value.toStringAsFixed(3)}",

                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              230,
                                              57,
                                              48,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // La  partie solution et son  boutton d'écourte
                                Container(
                                  padding: EdgeInsets.only(left: 25, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Solution",
                                        style: TextStyle(
                                          color: Color(0xFF045435),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 2),

                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.volume_up,
                                          color: Color(0xFF045435),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),
                                Container(
                                  width: 340,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Obx(
                                        () => markdown(controller.solution[0]),
                                      ),
                                      const SizedBox(height: 15),
                                      Obx(
                                        () => markdown(controller.solution[1]),
                                      ),

                                      const SizedBox(height: 15),
                                      Obx(
                                        () => markdown(controller.solution[2]),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            )
                          : Center(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Text(
                                  "L'image soumise n'est pas une feuille de riz. Veuillez soumettre une image claire et nette d'une feuille de riz.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                      255,
                                      230,
                                      52,
                                      25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  )
                :
                  // lorsque la personne n'as pas de connection
                  Expanded(
                    child: Container(
                      child:
                          controller.riceLeafDetectionResult.value !=
                              "Pas une image de riz"
                          ? ListView(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 25, top: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),

                                          color: Color(0xFF045435),
                                        ),
                                        child: Text(
                                          "Maladie detectée",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              238,
                                              240,
                                              239,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          controller.disease.value,
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              230,
                                              57,
                                              48,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                //  la probabilité
                                Container(
                                  padding: EdgeInsets.only(left: 25, top: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),

                                          color: Color(0xFF045435),
                                        ),
                                        child: Text(
                                          "Fiabilité",
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              238,
                                              240,
                                              239,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(),
                                        child: Text(
                                          "${controller.maxProb.value.toStringAsFixed(3)}",

                                          style: TextStyle(
                                            color: Color.fromARGB(
                                              255,
                                              230,
                                              57,
                                              48,
                                            ),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // La  partie solution et son  boutton d'écourte
                                Container(
                                  padding: EdgeInsets.only(left: 25, top: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Solution",
                                        style: TextStyle(
                                          color: Color(0xFF045435),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                        ),
                                      ),
                                      const SizedBox(width: 2),

                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.volume_up,
                                          color: Color(0xFF045435),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 20),

                                Container(
                                  width: 340,
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      Obx(
                                        () => markdown(controller.solution[0]),
                                      ),
                                      const SizedBox(height: 15),
                                      Obx(
                                        () => markdown(controller.solution[1]),
                                      ),

                                      const SizedBox(height: 15),
                                      Obx(
                                        () => markdown(controller.solution[2]),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            )
                          : Center(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: Text(
                                  "L'image soumise n'est pas une feuille de riz. Veuillez soumettre une image claire et nette d'une feuille de riz.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                      255,
                                      230,
                                      52,
                                      25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
          ],
        ),
      ),

      floatingActionButton: loginController.access_token.isNotEmpty
          ? FloatingActionButton(
              onPressed: () {
                Get.bottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
               SizedBox(
                height: Get.height*0.8,
                 child: Obx(
                         ()=>DashChat(currentUser:controler.moi, onSend:controler.onSend , messages: controler.messages,
                         typingUsers: controler.isTyping.value ? [controler.bot]: [],
                 
                              messageOptions: MessageOptions(
                           currentUserContainerColor: Color(0xFF045435),
                           containerColor: Colors.grey.shade200,
                           showTime: true,
                         ),
                 
                              inputOptions: InputOptions(
                           inputDecoration: InputDecoration(
                             hintText: "Écrire un message...",
                             filled: true,
                             fillColor: Colors.grey.shade100,
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(20),
                               borderSide: BorderSide.none,
                             ),
                           ),
                         ),
                        )
                         
                       ),
               ),
                );
              },
              child: Icon(Icons.message_outlined, color: Color(0xFF045435)),
            )
          : null,
    );
  }
}

Widget markdown(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        ".",
        style: GoogleFonts.sekuya(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
