import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:monlikountche/App/modules/models/userModel.dart';
import 'package:monlikountche/App/modules/routes/appRoute.dart';

class AuthService {
  Usermodel? loginData;
  Usermodel? signInData;
  Usermodel? updateData;

  final String baseLink = "https/";
  Future<void> userlogin(String email, String password) async {
    final String url = "$baseLink";

    // Implémentez la logique de connexion ici
    final req = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    final data = Usermodel.FromMap(jsonDecode(req.body));
    final statuCode = req.statusCode;

    if (statuCode == 200) {
      print("Login successful");
    } else {
      print("Login failed with status code: $statuCode");
      print("Login failed: ");
    }
  }

  Future<void> userSignIn(String email, String password, String name) async {
    // final Map data;
    print("Entré dans la fonction de sign in  de l'utilisateur");
    Uri loginURl = Uri.parse(baseLink + "dummyjson.com/users/add");

    final req1 = await http.post(
      loginURl,
      headers: {"content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );

    signInData = Usermodel.FromMap(jsonDecode(req1.body));

    if (req1.statusCode == 200 || req1.statusCode == 201) {
      print("la requète a été accepté ");

      Get.offNamed(approute.swith);
    } else {
      print("requète rejeté avec statucode ${req1.statusCode}");
    }
  }

  //  Future<void> updateData() async {
  // }
  // pour déterminé la localisation de la persone



}
