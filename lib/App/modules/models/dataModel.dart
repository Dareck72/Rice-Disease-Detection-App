import 'package:image_picker/image_picker.dart';

class DataModel {
  final XFile image_path;
  final String disease_name;
  final DateTime created_at;

  DataModel({
    required this.image_path,
    required this.disease_name,
    required this.created_at    ,
  });

  factory DataModel.fromjson(Map data) {
    return DataModel(
      image_path: data["image_path"],
      disease_name: data["disease_name"],
      created_at: data["created_at"],
    );
  }
  toMap(DataModel map) {
    return{
      "image_path":map.image_path,
      "disease_name":map.disease_name,
      "created_at":map.created_at,
    };
  }
}
