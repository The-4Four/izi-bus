import 'package:geolocator/geolocator.dart';

class HomeController {
  late Position _currentPosition;

  Future<Position?> determinePosition() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    _currentPosition = position;
    return _currentPosition;
    // Ask permission from device
  }
}
