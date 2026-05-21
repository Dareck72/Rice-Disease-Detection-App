import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:monlikountche/App/modules/controllers/loginController.dart';
import 'package:monlikountche/App/modules/models/userModel.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

class AuthService {
  Usermodel? loginData;
  Usermodel? signInData;
  Usermodel? updateData;

  Logincontroller logincontroller = Get.find<Logincontroller>();
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
    final String access_token = data["access_token"] ?? "";

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

  Future<dynamic> UserUpdate(String nom, String prenoms) async {
    Uri url = Uri.parse(baseLink + "/modifier");

    final request = await http.put(
      url,
      headers: {
        "Content-Type": "Application/json",
        "Authorization": "bearer ${logincontroller.access_token.value}",
      },

      body: jsonEncode({"nom": nom, "prenoms": prenoms}),
    );

    final statucode = request.statusCode;

    if (statucode == 200 || statucode == 201) {
      final data = jsonDecode(request.body);

      return data;
    } else {
      print("$statucode");
      return "Erreur lors de la mise à jour du profil";
    }
  }

  // modifier le password de l'utilisateur

  Future<Map<String, dynamic>> Updatepassord(
    String old_password,
    String new_password,
    String new_password_confirm,
    GlobalKey<FormState> formKey,
  ) async {
    Uri url = Uri.parse(baseLink + "/update_password");

    final request = await http.put(
      url,
      headers: {
        "Content-Type": "Application/json",
        "Authorization": "bearer ${logincontroller.access_token.value}",
      },

      body: jsonEncode({
        "old_password": old_password,
        "new_password": new_password,
        "new_password_confirm": new_password_confirm,
      }),
    );

    final statucode = request.statusCode;
    try {
      if (statucode == 200 || statucode == 201) {
        final data = jsonDecode(request.body);
        Get.offAllNamed(approute.login);
        formKey.currentState?.reset();

        return data;
      } else {
        print("le statut code est : $statucode");
        print("Erreur lors de la demande de réinitialisation du mot de passe");

        Get.snackbar(
          "Erreur",
          "Erreur lors de la demande de réinitialisation du mot de passe",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      throw Exception("Erreur lors de la mise à jour du mot de passe: $e");
    }

    return {"error": "Erreur lors de la mise à jour du mot de passe"};
  }

  // le forgotpassword de l'utilisateur

  Future<dynamic> forgotPassword(String email) async {
    Uri url = Uri.parse(baseLink + "/forgot_password");

    final request = await http.post(
      url,
      headers: {"Content-Type": "Application/json"},
      body: jsonEncode({"email": email}),
    );
    final statucode = request.statusCode;
    if (statucode == 200 || statucode == 201) {
      final data = jsonDecode(request.body);
      Get.toNamed(approute.resetPassword);

      return data;
    } else {
      print("le statut code est : $statucode");
      print(
        "Erreur lors de la demande d'emailpour la réinitialisation  du mot de passe",
      );
      return "Erreur lors de la demande d'emailpour la réinitialisation du mot de passe";
    }
  }

  Future<dynamic> resetPassword(
    String email,
    String code,
    String new_password,
    String new_password_confirm,
    GlobalKey<FormState> formkey,
  ) async {
    Uri url = Uri.parse(baseLink + "/reset_password");

    final request = await http.post(
      url,
      headers: {"Content-Type": "Application/json"},
      body: jsonEncode({
        "email": email,
        "code": code,
        "new_password": new_password,
        "new_password_confirm": new_password_confirm,
      }),
    );

    final statucode = request.statusCode;

    if (statucode == 200 || statucode == 201) {
      final data = jsonDecode(request.body);
      formkey.currentState!.reset();
      return data;
    } else {
      print("le statut code est : $statucode");

      print("le message envoyé est : ${jsonDecode(request.body)}");
      print("Erreur lors de la demande de réinitialisation du mot de passe");
      return "Erreur lors de la demande de réinitialisation du mot de passe";
    }
  }





}
