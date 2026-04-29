import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:monlikountche/App/modules/models/userModel.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

class AuthService {
  Usermodel? loginData;
  Usermodel? signInData;
  Usermodel? updateData;


  final String baseLink = "https://monlikoun-api.onrender.com";

  Future<String> userlogin(String email, String password) async {
    final String url = "$baseLink/login";

    // Implémentez la logique de connexion ici
    final req = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    print("Aprés le valide de la connexion");

    final data = jsonDecode(req.body);
     

    
    final statuCode = req.statusCode;
   final String  access_token = data["access_token"] ?? "";

    if (statuCode == 200) {
      Get.toNamed(approute.swith);
      return access_token;
    } else {
      print("Login failed with status code: $statuCode");

      Get.snackbar(
        "Erreur de connexion",
        "Veuillez vérifier vos identifiants et réessayer.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        colorText: Colors.white,
      );
    }
    return "";
  }

  Future<void> userSignIn(Usermodel user) async {
    // final Map data;
    print("Entré dans la fonction de sign in  de l'utilisateur");
    Uri loginURl = Uri.parse("$baseLink/register");

    final req1 = await http.post(
      loginURl,
      headers: {"content-Type": "application/json"},
      body: jsonEncode({
        "nom": user.nom,
        "prenoms": user.prenom,
        "email": user.email,
        "password": user.password,
        "sex": user.sex,
        "localisation": user.localisation,
      }),
    );

    // signInData = Usermodel.FromMap(jsonDecode(req1.body));

    if (req1.statusCode == 200 || req1.statusCode == 201) {
      print("la requète a été accepté ");

      Get.offNamed(approute.swith);
    } else {
      print("requète rejeté avec statucode ${req1.statusCode}");
      print("requète rejeté avec le message ${req1.body}");
    }
  }

  Future<void> UserUpdate(Usermodel user) async {
    Uri url = Uri.parse(baseLink + "/users/me");
    final request = await http.put(
      url,
      headers: {"Content-Type": "Application/json", "Autorization": "bearer "},
      body: jsonEncode({
        "firstname": user.nom,
        "lastname": user.prenom,
        "email": user.email,
        "password": user.password,
      }),
    );

    final statucode = request.statusCode;

    if (statucode == 200 || statucode == 201) {
      print("satucode valide");
      updateData = jsonDecode(request.body);
    } else {
      print("Statut code invalide");
      print("$statucode");
    }
  }

 
}
