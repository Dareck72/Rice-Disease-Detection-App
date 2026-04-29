import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';

class uploadData {
  Logincontroller logincontroller = Get.find<Logincontroller>();

  String url = "https://monlikoun-api.onrender.com/upload";

  Future sendData(XFile Image, String name) async {

    print("entrez dans la foncion de l'upload de donnée dans l'API");

    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers["Authorization"] =
        'Bearer ${logincontroller.access_token.value}';
    print ("le token est : ${logincontroller.access_token.value}");
    request.headers["content-Type"] = "multipart/form-data";
    request.fields["disease_name"] = name;

    request.files.add(await http.MultipartFile.fromPath("file", Image.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      print("Image uploadée avec succès ");

      return true;
    } else {
    
      print("Echec de l'upload de l'image avec le status code : ${response.statusCode} et le message d'erreur : ${response.reasonPhrase}");
      throw Exception("erreur API");
    }
  }

  // ne montez pas et descendez les escaliers dans ta maison pour  quelques semaine

  getHistoryData() async {
    var request = await http.get(Uri.parse(url));
    int statucode = request.statusCode;
    if (statucode == 200 || statucode == 201) {
      print("requete accepté ");
      Map data = jsonDecode(request.body);
      return data;
    }
  }
}
