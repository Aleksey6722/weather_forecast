import 'package:geolocator/geolocator.dart';

class Location {
  late double latitude;
  late double longitude;
  late LocationPermission permission;

  Future<void> getCurrentLocation() async {
    try {
      var per = await Geolocator.requestPermission();
      Position position = await Geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
          .timeout(Duration(seconds: 15));
      latitude = position.latitude;
      longitude = position.longitude;
      permission = await Geolocator.checkPermission();
    } catch(error) {
        throw '$error';
    }
  }
}