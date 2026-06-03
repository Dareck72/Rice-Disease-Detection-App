import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:monlikountche/App/modules/controllers/loginController.dart';
import 'package:monlikountche/App/services/uploadData.dart';
import 'package:monlikountche/App/services/userServices.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Resultcontroller extends GetxController {
  List<String> classes = [
    "Tache brune",
    "Echefaudure de feuille",
    "Sain",
    "Puriculariose",
  ];


  Map<int, List> diseaseSolution = {
    0: [
      "Appliquer du Dithane M-45 (Mancozèbe) très disponible dans les marchés d'Abomey-Calavi et Cotonou",

      "Amender le sol avec du NPK 10-18-18 ou de la farine d'os pour renforcer le potassium",

      "Irriguer régulièrement avec les eaux des bas-fonds en saison sèche",
    ],
    1: [
      "Utiliser de la Bouillie Bordelaise (cuivre) vendue dans toutes les boutiques d'intrants au Bénin",
      "Éviter les blessures lors du sarclage manuel très pratiqué localement",
      "Bien drainer les périmètres irrigués comme ceux de la vallée de l'Ouémé",
    ],
  
    2: [
      "Votre plant de riz est en bonne santé, aucune maladie détectée",
      "Continuez à appliquer du NPK 15-15-15 pour maintenir une bonne fertilité du sol",
      "Surveillez régulièrement vos plants et maintenez un drainage correct de votre parcelle",
    ],
    3: [
      "Appliquer du Beam 75 WP (Tricyclazole) ou Fuji-One disponibles dans les agro-dealers au Bénin",
      "Réduire les apports d'urée (NPK 15-15-15) pour éviter l'excès d'azote",
      "Utiliser des variétés résistantes comme NERICA 4 ou TOX 3145 vulgarisées par le MAEP",
    ],
  };

  List<String> imageClasses = ["Pas une image de riz", "image de riz"];
  Logincontroller logincontroller = Get.find<Logincontroller>();
  var data = {}.obs;
  RxList solution = [].obs;
  RxList description = [].obs;
  RxInt predictedIndex = 0.obs;
  RxString disease = "".obs;
  RxDouble maxProb = 0.0.obs;

  // fonction de prédiction si c'est une feuille de riz ou pas

  RxString riceLeafDetectionResult = "".obs;

  void recommendation() async {
    data.value = await currentUser().recommendation(disease.value);
    print("Les données sont entres autres ");
    print(data);
  }

  // fonction pour la prediction de la maladie



  void prediction(XFile data) async {
    print("entré dans la fonction de prédiction");
    Interpreter interpreter = await Interpreter.fromAsset(
      'assets/RiceDiseaseDetectionModel/Model_ofEfficientNetV2B0.tfLite',
    );
    img.Image ImageInput = img.decodeImage(File(data.path).readAsBytesSync())!;

    img.Image resized = img.copyResize( ImageInput, width: 256, height: 256 );

    // conversion en tableau
    var input = List.generate(
      1,
      (i) => List.generate(
        256,
        (y) => List.generate(256, (x) {
          var pixel = resized.getPixel(x, y);
          return [   pixel.r / 255.0,   pixel.g / 255.0,   pixel.b / 255.0   ] ;
        }
        ),
      ),
    );

    var output = List.filled(1 * 4, 0).reshape([1, 4]);

    interpreter.run(input, output);
    var prediction  = output[0];
    maxProb.value = prediction[0];
    int predictedIndex = 0;
print("Les probabilités sont : $prediction"); 
    for (int i = 1; i < prediction.length; i++) {
      if (prediction[i] > maxProb.value) {
        print("Les probabilités dans la boucle"); 
        maxProb.value = prediction[i];
         print("La plus grande probabilité est : ${maxProb.value}"); 
        predictedIndex = i; //
        print("L'index de la maladie prédite est : $predictedIndex");
      }
    }

    disease.value = classes[predictedIndex];
    // description.value = diseaseDescription[predictedIndex]!;
    solution.value = diseaseSolution[predictedIndex]!;


    print("La maladie détecté est : $disease");
    print("La probabilité est  : ${maxProb.value}");
    print("Sortie de la fonction de prédiction");

    // ajouter les data dans l'API

    if (logincontroller.access_token.isNotEmpty) {
      uploadData().sendData(data, disease.value);
      print("les recommandations");
      recommendation();
    } else {
      uploadData().sendDataWithoutConnexion(data.path, disease.value, DateTime.now());
    }
  }


detectRiceLeaf(XFile image) async {
  print("entré dans la fonction de détection de feuille de riz");

  Interpreter interpreter = await Interpreter.fromAsset(
    'assets/RiceDiseaseDetectionModel/model_quant.tflite',
  );

  img.Image imageInput = img.decodeImage(File(image.path).readAsBytesSync())!;
  img.Image resized = img.copyResize(imageInput, width: 256, height: 256);

  var input = List.generate(
    1,
    (i) => List.generate(
      256,
      (y) => List.generate(256, (x) {
        var pixel = resized.getPixel(x, y);

        return [
          pixel.r / 255.0,
          pixel.g / 255.0,
          pixel.b / 255.0,
        ];
      }),
    ),
  );

  // Sortie adaptée à Dense(1, activation='sigmoid')
  var output = List.filled(1 * 1, 0.0).reshape([1, 1]);

  print("+++++++++++++++++++++ ============ $output");

  interpreter.run(input, output);

  // Probabilité retournée par le modèle
  double pred = output[0][0];

  print("Probabilité prédite : $pred");

  // Si probabilité >= 0.5 => feuille de riz
  if (pred >= 0.5) {
    riceLeafDetectionResult.value = imageClasses[1];
  } else {
    riceLeafDetectionResult.value = imageClasses[0];
  }

  if (riceLeafDetectionResult.value == "Pas une image de riz") {
    print("L'image soumise n'est pas une feuille de riz");

    Get.snackbar(
      "Image non valide",
      "L'image soumise n'est pas une feuille de riz. Veuillez soumettre une image claire et nette d'une feuille de riz.",
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
    );
  } else {
    prediction(image);
  }

  interpreter.close();
}



}
