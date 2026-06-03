import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:monlikountche/App/modules/controllers/loginController.dart';

class currentUser {
  final String baseink = "https://monlikoun-api.onrender.com";
  Logincontroller logincontroller = Get.find<Logincontroller>();
  var data;


  Future<Map<String, dynamic>> getUser() async {
    final String url = "$baseink/profil";

    final req = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${logincontroller.access_token.value}",
      },
    );

    print("Aprés le valide de la connexion");

    data = jsonDecode(req.body);
    print("Data user : $data");

    final statuCode = req.statusCode;

    if (statuCode == 200 || statuCode == 201) {
      print("User data retrieved successfully: $data");
      return data;
    } else {
      print("Login failed with status code: $statuCode");
    }
    return {};
  }


  Future<Map<String, dynamic>> recommendation(String disease) async {
    print("Entrer dans la fonction de recommendation pour l'utilisateur");

    Uri url = Uri.parse(baseink + "/recommandations");

    final req = await http.post(
      url,

      headers: {"authorization": "", "Content-Type": "application/json"},
      body: jsonEncode({"disease_name": disease}),
    );
    // le statucode

    final Statucode = req.statusCode;
    if (Statucode == 200 || Statucode == 201) {
      print("Le statut code est : $Statucode");
      final data = jsonDecode(req.body);
      return data;
    } else {
      print(" la requète a refusé  ");
      print("Le statut code est : $Statucode");
    }
    return {};
  }




}
