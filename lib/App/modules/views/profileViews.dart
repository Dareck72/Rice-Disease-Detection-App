import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:monlikountche/App/modules/controllers/geolocationController.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';
import 'package:monlikountche/App/modules/controllers/profileController.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

class Profileviews extends GetView<Profilecontroller> {
  @override
  Widget build(BuildContext context) {
    Logincontroller logincontroller = Get.find<Logincontroller>();
    Geolocationcontroller geolocation = Get.find<Geolocationcontroller>();

    final formkey = GlobalKey<FormState>();

    final passwordFormkey = GlobalKey<FormState>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (logincontroller.access_token.isNotEmpty) {
        controller.setUserData();
      }
    });

    dialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: AlertDialog(
              content: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: formkey,
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
                        // Pour le Nom
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nom",
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

                          controller: controller.updateNomController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nom nécéssaire";
                            }

                            return null;
                          },
                        ),

                        const SizedBox(height: 30),
                        // Pour le Prenom
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Prenom",
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

                          controller: controller.updatePrenomController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Prenom nécéssaire";
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
                                  print("le bouttons de connexion pressé");

                                  if (formkey.currentState!.validate()) {
                                    print("Aprés le validate");

                                    controller.loading.value = true;

                                    print(
                                      "la valeur de loading ${controller.loading.value}",
                                    );

                                    await controller.dataUpdate();
                                    controller.loading.value = false;
                                    print(
                                      "la valeur de loading ${controller.loading.value}",
                                    );
                                  }
                                },
                          child: Obx(
                            () => controller.loading.value == true
                                ? LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.white,
                                    size: 40,
                                  )
                                : Text(
                                    "Modifier le profil",
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

    passwordChangeDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            child: AlertDialog(
              content: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: passwordFormkey,
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

                        // Pour l'ancien password
                        Obx(
                          () => TextFormField(
                            obscureText: controller.oldObcurText.value,

                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.oldObcurText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.green,
                                ),

                                onPressed: () {
                                  controller.oldObcurText.value =
                                      !controller.oldObcurText.value;
                                },
                              ),

                              labelText: "Ancien mot de passe",
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

                            controller: controller.oldPasswordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ancien mot de passe nécéssaire";
                              }

                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Pour le nouveaun password
                        Obx(
                          () => TextFormField(
                            obscureText: controller.newObcurText.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.newObcurText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.green,
                                ),

                                onPressed: () {
                                  controller.newObcurText.value =
                                      !controller.newObcurText.value;
                                },
                              ),

                              labelText: "Nouveau mot de passe",
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
                                return "Nouveau mot de passe nécéssaire";
                              }

                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Pour la comfirmation du  nouveaun password
                        Obx(
                          () => TextFormField(
                            obscureText: controller.newObcurText.value,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.newObcurText.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.green,
                                ),

                                onPressed: () {
                                  controller.newObcurText.value =
                                      !controller.newObcurText.value;
                                },
                              ),

                              labelText: "Nouveau mot de passe",
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

                            controller: controller.newPasswordConfirmController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Nouveau mot de passe nécéssaire";
                              }

                              return null;
                            },
                          ),
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
                                  print("le bouttons de connexion pressé");

                                  if (passwordFormkey.currentState!
                                      .validate()) {
                                    print("Aprés le validate");

                        
                                    controller.loading.value = true;

                                    print(
                                      "la valeur de loading ${controller.loading.value}",
                                    );

                                    await controller.updateUserPassword(passwordFormkey);
                                    controller.loading.value = false;
                                    print(
                                      "la valeur de loading ${controller.loading.value}",
                                    );

                                  }
                                },
                          child: Obx(
                            () => controller.loading.value == true
                                ? LoadingAnimationWidget.staggeredDotsWave(
                                    color: Colors.white,
                                    size: 40,
                                  )
                                : Text(
                                    "Modifier le le mot de passe",
                                    style: TextStyle(
                                      fontSize: 15,
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
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () async => controller.raffraichir( logincontroller.access_token.value ),
        child: Stack(
          children: [
            // 1. Fond : Image + Partie Blanche
            Column(
              children: [
                // Image de couverture
                Container(
                  height: 250, // Hauteur fixe pour la couverture
                  width: double.infinity,
                  child: Image.asset(
                    'assets/image/profileimg.png',
                    fit: BoxFit.cover,
                  ),
                ),
        
                // Partie informations qui prend tout le reste
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 120,
                          ), // Espace pour laisser passer l'avatar
        
                          Obx(
                            () => _buildProfileItem(
                              action: () {
                                dialog();
                              },
                              icon: Icons.person_outline,
                              title: "Information",
                              subtitle:
                                  "${controller.nom.value} , ${controller.email.value}",
                              icontrain: Icons.edit_outlined,
                            ),
                          ),
                          if (logincontroller.access_token.isNotEmpty)
                            const SizedBox(height: 25),
                          if (logincontroller.access_token.isNotEmpty)
                            _buildProfileItem(
                              action: () {
                                passwordChangeDialog();
                              },
        
                              icontrain: Icons.edit_outlined,
                              icon: Icons.password_outlined,
                              title: "Changer de mot de passe",
                              subtitle: "",
                            ),
                          const SizedBox(height: 25),
        
                          _buildProfileItem(
                            action: () {},
                            icon: Icons.location_on_outlined,
                            title: "Localisation",
                            subtitle:
                                "${geolocation.city} -- ${geolocation.country}",
                          ),
                          const SizedBox(height: 25),
        
                          _buildProfileItem(
                            action: () {},
                            icon: Icons.language,
                            title: "Langue",
                            subtitle: "Français",
                          ),
        
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
        
            // 2. L'avatar positionné à cheval entre l'image et le blanc
            Positioned(
              top: 175, // Ajusté pour être bien centré sur la ligne de séparation
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 4,
                    ), // Cercle blanc autour
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFFCAFAE7),
                    radius: 70,
                    child: Icon(
                      Icons.person_2_outlined,
                      size: 60,
                      color: Color(0XFF045435),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Petit Helper pour éviter de répéter le code des ListTile
  Widget _buildProfileItem({
    IconData? icontrain,
    IconData? icon,
    required String title,
    required String subtitle,
    required VoidCallback action,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFFCAFAE7).withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Color(0XFF045435)),
        ),
        title: Text(
          title,
          style: GoogleFonts.istokWeb(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          overflow: TextOverflow.ellipsis,
          subtitle,
          style: TextStyle(fontSize: 15, color: Colors.grey[600]),
        ),
        trailing: IconButton(
          onPressed: () {
            action();
          },
          icon: Icon(icontrain),
        ),
      ),
    );
  }
}
