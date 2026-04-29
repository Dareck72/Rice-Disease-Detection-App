import 'package:flutter/foundation.dart';

class Usermodel {
  final String nom;
  final String prenom;
  final String email;
  final String password;
  final String sex;
  final  String localisation;

  Usermodel({
    required this.email,
    required this.nom,
    required this.prenom,
    required this.password,
     this.sex = "",
     this.localisation = "",
  });

   factory Usermodel.FromMap(Map<String, dynamic> map) {
    return Usermodel(
      nom: map["nom"],
      prenom: map["prenom"],
      email: map["email"],
      password: map["password"],
      sex: map["sex"],
      localisation: map["localisation"],
    );
  }

  Map<String, dynamic> toMap(Usermodel user) {
    return {
      "email":user.email,
      "nom":user.nom,
      "prenom":user.prenom,
      "sex":user.sex
    };
  }
}
