import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monlikountche/App/modules/controllers/profileController.dart';

class Profileviews extends GetView<Profilecontroller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                        const SizedBox(height: 120), // Espace pour laisser passer l'avatar
                        
                        _buildProfileItem(
                          icon: Icons.person_outline,
                          title: "Nom et prenom",
                          subtitle: "DOSSOU AUREL",
                        ),
                        const SizedBox(height: 25), 
                        _buildProfileItem(
                          icon: Icons.email_outlined,
                          title: "Email",
                          subtitle: "dossouaurel72@gmail.com",
                        ),
                        const SizedBox(height: 25), 

                        _buildProfileItem(
                          icon: Icons.location_on_outlined,
                          title: "Département",
                          subtitle: "Atlantique",
                        ),
                        const SizedBox(height: 25), 

                        _buildProfileItem(
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
                  border: Border.all(color: Colors.white, width: 4), // Cercle blanc autour
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2)
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Color(0xFFCAFAE7),
                  radius: 70,
                  child: Icon(Icons.person_2_outlined, size: 60, color: Color(0XFF045435)),
                ),
              ),
            ),
          ),

          // 3. Optionnel : Bouton retour si nécessaire
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }

  // Petit Helper pour éviter de répéter le code des ListTile
  Widget _buildProfileItem({required IconData icon, required String title, required String subtitle}) {
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
          subtitle,
          style: TextStyle(fontSize: 15, color: Colors.grey[600]),
        ),
        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit_outlined)),
      ),
    );
  }
}