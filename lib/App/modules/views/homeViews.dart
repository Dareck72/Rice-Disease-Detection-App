import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monlikountche/App/modules/controllers/homeController.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';
import 'package:monlikountche/App/modules/controllers/resultController.dart';
import 'package:monlikountche/App/modules/controllers/swithController.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

class Homeviews extends GetView<Homecontroller> {
  @override
  Widget build(BuildContext context) {
    // le code pour le dialog

    Resultcontroller resultController = Get.find<Resultcontroller>();
    Logincontroller logincontroller = Get.find<Logincontroller>();
    Swithcontroller swithcontroller = Get.find<Swithcontroller>();

    dialog() {
      return showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: Alignment.topRight,
            child: Container(
              color: Colors.white,
              height:logincontroller.access_token.value.isEmpty ? 270 : 250,
              width: 200,
              child: Column(
                children: [
                  const SizedBox(height: 15),

                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 5,
                      minimumSize: Size(170, 30),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Bibliothèque",
                      style: GoogleFonts.istokWeb(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),


                    if(logincontroller.access_token.value.isEmpty)
                
                  TextButton(

                    style: TextButton.styleFrom(
                      elevation: 5,
                      minimumSize: Size(170, 30),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.toNamed(approute.login);
                    },
                    child: Text(
                      "Se connecter",
                      style: GoogleFonts.istokWeb(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                  ),


                 
                  TextButton(

                    style: TextButton.styleFrom(
                      elevation: 5,
                      minimumSize: Size(170, 30),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      Get.toNamed(approute.history);
                    },
                    child: Text(
                      "Historique",
                      style: GoogleFonts.istokWeb(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  
                  ),


                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 5,
                      minimumSize: Size(170, 30),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                      swithcontroller.pageIndex.value = 1;
                    },
                    child: Text(
                      "Mon compte",
                      style: GoogleFonts.istokWeb(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),


                  TextButton(
                    style: TextButton.styleFrom(
                      elevation: 5,
                      minimumSize: Size(170, 30),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Drône option",
                      style: GoogleFonts.istokWeb(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }


    bottom() {
      Get.bottomSheet(
        Container(
          height: 150,
          color: Colors.white,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text("Prendre une photo"),
                onTap: () async {
                  await controller.pickImage(ImageSource.camera);
                  if (controller.data == null) {
                    Get.back();
                  } else {
                    Get.toNamed(approute.result);
                     resultController.prediction(controller.data!);
                  }
                },
              ),

              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Choisir dans la galerie"),
                onTap: () async {
                  await controller.pickImage(ImageSource.gallery);
                  if (controller.data == null) {
                    Get.back();
                  } else {
                    Get.toNamed(approute.result);
                    resultController.prediction(controller.data!);
                  }
                },
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
backgroundColor: Colors.white,
    
      body: Column(
        children: [
          SizedBox(height: 30),

          //le logo et le menu
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 150,
                      height: 50,
                      child: Image.asset('assets/image/logo (2).png',height: 50,width: 120,),
                    ),
                   
                  ],
                ),

                IconButton(
                  onPressed: () {
                    dialog();
                  },
                  icon: Icon(Icons.more_vert, size: 30),
                ),
              ],
            ),
          ),

          // la partie du carrousel
          SizedBox(height: 40),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 40),

              decoration: BoxDecoration(
                color: Color.fromARGB(255, 188, 246, 222),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  topRight: Radius.circular(20),
                ),
              ),

              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // le carrousel
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 400.0,
                        autoPlay: true, // Défilement automatique
                        enlargeCenterPage:
                            true, // Effet de zoom sur l'image centrale
                        viewportFraction: 0.9, // Portion de l'écran occupée
                      ),

                      items: controller.imageAndText.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRect(
                              child: Stack(
                                children: [
                                  const SizedBox(height: 40),

                                  Container(
                                    height: 320,
                                    width: 400,
                                    child: Image.asset(item["image"]!),
                                  ),

                                  Positioned(
                                    bottom: 0,
                                    left: 20,
                                    right: 20,

                                    child: Text(
                                      item["text"]!,
                                      style: GoogleFonts.istokWeb(
                                        fontStyle: FontStyle.normal,
                                        color: const Color.fromARGB(
                                          255,
                                          23,
                                          22,
                                          22,
                                        ),
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    // la partie du boutton pour téléversé l'image
                    SizedBox(height: 40),

                    TextButton.icon(
                      onPressed: () async {
                        await bottom();
                      },
                      style: TextButton.styleFrom(
                        elevation: 5,
                        minimumSize: Size(300, 60),
                        backgroundColor: Color(0XFF045435),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),

                      icon: FaIcon(
                        FontAwesomeIcons.upload,
                        size: 30,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Téleverser une image",
                        style: GoogleFonts.istokWeb(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
