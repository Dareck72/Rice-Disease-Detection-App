import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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

            // Pour la parties de l'image
            Container(
              child: Stack(
                children: [
                  if (homeController.data != null)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(

                        )
                      ),
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

//pour la partie du text et des bouttons 

            Container(
              padding: EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Text(
                    "Symptome",
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
       
       
   const SizedBox(
    height: 25,
   ),
//   la description de la feuille de maladie 
             Container(
              width: 340,
              padding: EdgeInsets.all(15),
              child: Column(
                  children: [
                markdown("Jaunissement progressif des extrémités des feuilles"),
                const SizedBox(height: 15,),
                markdown(" Stries allongées jaunâtres à brun clair"),
                const SizedBox(height: 15,),
                 markdown("Aspect flétri des feuilles")
             ],
              ),
             ) 
      ,
     const SizedBox(
    height: 20,
   ),

Container(

  padding: EdgeInsets.all(10),
  height: 120,
decoration: BoxDecoration(
  color: Color(0xFFEEEAEA),
  
),
child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [

    //la maladie détecté 
    Row(
      children: [
     
        Text("Maladie détectée :", style: GoogleFonts.istokWeb(
      fontSize: 22,
      fontWeight: FontWeight.w400,
     color: const Color.fromARGB(255, 20, 87, 22)
        ),),

        const SizedBox(width: 10,),

        Text("Bactériose du riz",maxLines: 2,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 224, 207, 18)
        ),),
      ],
    ),

// Pour le niveaux de sureté 
 Row(
      children: [

        Text("Niveaux d'évolution :", style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: const Color.fromARGB(255, 20, 87, 22)
        ),),

        const SizedBox(width: 10,),

    Text("8 %" , style: TextStyle(
      fontSize: 20
    ),)
      ],
    ),



  ],
),
)
      

       , const SizedBox(
    height: 20,
   ),
      
      // La  partie slution et son  boutton d'écourte
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
      
    
          ],
        ),
      ),
    );
  }
}

Widget markdown(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(".",style: GoogleFonts.sekuya(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),),
      const SizedBox(width: 10,),
      Expanded(
        child: Text(text, style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),),
      )
    ],
  );
}

