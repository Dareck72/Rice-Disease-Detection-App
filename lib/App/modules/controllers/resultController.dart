import 'dart:io';

import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:monlikountche/App/modules/controllers/homeController.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class Resultcontroller extends GetxController {
  // late Interpreter interpreter;

  RxString Diseasedetected = "".obs;

  RxString evolution = "".obs;

  XFile? riceDisease = Homecontroller().data;

  void prediction(XFile data) async {
    Interpreter interpreter = await Interpreter.fromAsset('model.tflite');

    img.Image ImageInput = img.decodeImage(
      File(riceDisease!.path).readAsBytesSync(),
    )!;
    img.Image resized = img.copyResize(ImageInput, width: 256, height: 256);

    // conversion en tableau
    var input = List.generate(
      1,
      (i) => List.generate(
        256,
        (y) => List.generate(256, (x) {
          var pixel = resized.getPixel(x, y);
          return [
            // (img.getR(pixel)) / 255.0,
            // (img.getGreen(pixel)) / 255.0,
            // (img.getBlue(pixel)) / 255.0,
          ];
        }),
      ),
    );

    var output = List.filled(1 * 3, 0).reshape([1, 3]);

    interpreter.run(input, output);
  }
}
