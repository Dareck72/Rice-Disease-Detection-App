import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Homecontroller extends GetxController {
//  LE bottomsheet
  XFile? data;
  Future<XFile?> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
    data = image;
    update(); // <--- TRÈS IMPORTANT : Dit à GetX de redessiner les widgets concernés
  }
   
    return data;
  }

  final List<Map<String, String>> imageAndText = [
    {
      "image": "assets/image/First.png",
      "text":
     "Des taches sur vos plans de riz ?"
    },
    {
      "image": "assets/image/clicUpload.png",
      "text": "Prenez une image de la feuille contaminée",
    },
    {
      "image": "assets/image/UseAI.png",
      "text":
          "Téléversez-la ici et obtenez un disagnostic en seulement quelques secondes",
    },
  ];


}
