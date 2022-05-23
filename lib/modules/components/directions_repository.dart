import 'package:dio/dio.dart';
import 'package:izi_bus/.env.dart';
import 'package:izi_bus/modules/components/directions_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//BASEADO NO CODIGO DE https://github.com/MarcusNg/flutter_gmaps

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';

  final Dio _dio;

  DirectionsRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    final response = await _dio.get(
      _baseUrl,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleAPIKey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return {} as Future<Directions>;
  }
}
