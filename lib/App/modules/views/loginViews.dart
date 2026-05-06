import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';

class Loginviews extends GetView<Logincontroller> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final __formkey = GlobalKey<FormState>();

    passwordUpdateDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: AlertDialog(
              content: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: __formkey,
                    child: Column(
                      children: [
                        const SizedBox(),

                        Container(
                          child: Image.asset(
                            "assets/image/logo.png",
                            width: 50,
                            height: 50,
                          ),
                        ),

                        const SizedBox(height: 30),
                    
                        // Pour l'email de l'utilisateur
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

                          validator: (value) {
                            if (value == null || value.isEmpty) 
                            {
                              return "Email nécéssaire";
                            
                            }
                            return null;
                          },
                       
                             ),
 
                        const SizedBox(height: 30),

                        TextButton(
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            backgroundColor: Color(0xFF045435),
                            minimumSize: Size(320, 50),
                          ),
                          onPressed: controller.loading.value
                              ? null
                              : () async {
                                  print(
                                    "le bouttons de changement de password pressé",
                                  );

                                  if (__formkey.currentState!.validate()) {
                                    print("Aprés le validate");

                                    controller.loading.value = true;

                                  
                                  }
                                },
                          child: Obx(
                            () => controller.loading.value == true
                                ? LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.white,
                                    size: 40,
                                  )
                                : Text(
                                    "Changer le password",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      );
    }


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
                      Obx(
                        () => TextFormField(
                          obscureText: controller.obscureValue.value,
                          decoration: InputDecoration(
                            suffixIcon: Obx(
                              () => IconButton(
                                onPressed: () {
                                  controller.obscureValue.value =
                                      !controller.obscureValue.value;
                                },
                                icon: Icon(
                                  controller.obscureValue.value
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
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
                              return "Mot de passe nécéssaire";
                            }
                            if (value.length <= 4) {
                              return "Entrer un pass word correcte";
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Container(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      passwordUpdateDialog();
                    },
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
                Obx(
                  () => TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Color(0xFF045435),
                      minimumSize: Size(320, 50),
                    ),
                    onPressed: controller.loading.value
                        ? null
                        : () async {
                            print("le bouttons de connexion pressé");

                            if (formKey.currentState!.validate()) {
                              print("Aprés le validate");

                              controller.loading.value = true;
                              await controller.login();
                              controller.loading.value = false;
                              formKey.currentState!.reset();
                            }
                          },
                    child: Obx(
                      () => controller.loading.value == true
                          ? LoadingAnimationWidget.staggeredDotsWave(
                              color: Colors.white,
                              size: 40,
                            )
                          : Text(
                              "Connectez vous",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
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
