import 'package:image_picker/image_picker.dart';

class DataModel {
  final XFile image;
  final String name;
  final String probability;
  final DateTime time;

  DataModel({
    required this.image,
    required this.name,
    required this.probability,
    required this.time,
  });

  factory DataModel.fromjson(Map data) {
    return DataModel(
      image: data["image"],
      name: data["name"],
      probability: data["probability"],
      time: data["time"],
    );
  }
  toMap(DataModel map) {
    return{
      "image":map.image,
      "name":map.name,
      "probability":map.probability,
      "time":map.time,
    };
  }
}
