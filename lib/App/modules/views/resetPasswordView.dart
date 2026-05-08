import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monlikountche/App/modules/controllers/resetPasswordController.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  @override
  final formKey = GlobalKey<FormState>();
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
                  "Mise a jour votre mot de passe",
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

                      // Le code 
                      TextFormField(
                          keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Code",
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

                        controller: controller.codeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Code nécéssaire";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 15),

                      // Le new password
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

                          controller: controller.newPasswordController,
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
                   
                  //  le comfirm password
                         const SizedBox(height: 15),

                    Obx(
                        () => TextFormField(
                          controller: controller.confirmPasswordController,
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

                // Le boutton pour le  reset du password 
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
                              await controller.resetPassword(formKey);
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
                              "Reset Password",
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
