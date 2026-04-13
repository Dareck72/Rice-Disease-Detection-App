import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';

class Loginviews extends GetView<Logincontroller> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15),

                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios, size: 20),
                  ),
                ),

                const SizedBox(height: 45),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/image/logo.png", width: 70, height: 70),
                    Text(
                      "monlikuntche",
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
                  "Connexion",
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

                      // L'email
                      TextFormField(
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
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    child: Text(
                      "Password oublié",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 3, 122, 44),
                      ),
                    ),
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
                    "Connectez vous",
                    style: TextStyle(
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
    );
  }
}
