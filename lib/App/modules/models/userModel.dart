import 'package:flutter/foundation.dart';

class Usermodel {
  final String name;
  final String email;
  final String password;
  final String tel;

  Usermodel({
    required this.email,
    required this.name,
    required this.password,
    required this.tel,
  });

   factory Usermodel.FromMap(Map<String, dynamic> map) {
    return Usermodel(
      email: map["email"],
      name: map["name"],
      password: map["password"],
      tel: map["tel"],
    );
  }

  Map<String, dynamic> toMap(Usermodel user) {
    return {
      "email":user.email,
      "name":user.name,
      "tel":user.tel
    };
  }
}
