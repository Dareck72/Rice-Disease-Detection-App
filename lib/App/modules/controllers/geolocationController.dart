import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Geolocationcontroller extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await _determinePosition();
    await determineCityCountry(late, long);
  }

  RxDouble late = 0.0.obs;
  RxDouble long = 0.0.obs;
  RxString city = ".".obs;
  RxString country = ".".obs;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
  
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
       print('Location services are disabled.');
      await Geolocator.getServiceStatusStream();
   
       Get.defaultDialog(
           
          title: "Erreur de localisation",
          middleText: "Votre localisation est inactive veuiller l'activé en appuyant sur accepté",

          titleStyle: TextStyle(
            color: const Color.fromARGB(255, 240, 7, 7),
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),

          middleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
            
             cancel:TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red
              ),
              onPressed: (){
              Get.back();
             }, child: Text("Refusé",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white
             ))) ,

             confirm: TextButton(
                 style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 58, 229, 11)
              ),
              
              onPressed: (){
              Geolocator.openLocationSettings();
             }, child: Text("Accepté",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.bold,
              fontSize: 16
             ),)) ,
         
         
        );
      
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();


      if (permission == LocationPermission.denied) {
          await Get.dialog(
        AlertDialog(
          title: Text("Permission refusée"),
          content: Text("La permission de localisation est nécessaire."),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text("OK"),
            ),
          ],
        ),
      );
      return Future.error('Location permissions are denied');
      }
    }
    print(
      "Une des permission accepté  ================================================",
    );
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    print(
      "La position est découverte =====================================================",
    );
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    late.value = position.latitude;
    long.value = position.longitude;

    return position;
  }

  Future determineCityCountry(RxDouble late, RxDouble long) async {
    print("Entré dans la fonction de détermination de la localisation");
    List placemarks = await placemarkFromCoordinates(late.value, long.value);
    Placemark place = placemarks[0];
    city.value = place.locality ?? 'Aucune ville';
    country.value = place.country ?? "aucun pays";
    print("la ville $city et le pays $country");
  }

}
