import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monlikountche/App/modules/controllers/registerController.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

class Registerview extends GetView<Registercontroller> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(26),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/image/logo.png", width: 70, height: 70),
                    Text(
                      "molikuntche",
                      style: TextStyle(
                        color: Color(0xFF045435),
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 35),

                Text(
                  "Inscription",
                  style: GoogleFonts.istokWeb(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF045435),
                  ),
                ),

                const SizedBox(height: 30),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Le nom de la personne
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        controller: controller.nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nom nécéssaire";
                          }
                        },
                      ),

                      const SizedBox(height: 15),

                      // L'email
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        controller: controller.emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nom nécéssaire";
                          }
                          if (!value.contains("@")) {
                            return "Entrer un email correct";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // Le password
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        controller: controller.passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nom nécéssaire";
                          }
                          if (value.length <= 4) {
                            return "Entrer un pass word correcte";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // téléphone
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Telephone",
                          labelStyle: TextStyle(
                            fontSize: 14,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),

                        controller: controller.telController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Nom nécéssaire";
                          }
                          if (!value.contains("@")) {
                            return "Entrer un email correct";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Le boutton de d'inscription
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    backgroundColor: Color(0xFF045435),
                    minimumSize: Size(320, 50),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Inscrivez vous",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Pour la partire  ou il y as se connecté
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(approute.login);
                        },
                        child: Text(
                          "Connectez-vous ",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),

//Pour ignorere
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                         side: BorderSide(
                          color: Colors.green,
                         )    ,
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                         ),
                         minimumSize: Size(100, 40)   

                        ),
                        onPressed: () {
                          Get.offAllNamed(approute.swith);
                        },
                        child: Text(
                          "Ignorer",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
