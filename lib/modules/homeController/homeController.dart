import 'package:geolocator/geolocator.dart';

class HomeController {
  Future<Position?> determinePosition() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position;
    // Ask permission from device
  }
}
