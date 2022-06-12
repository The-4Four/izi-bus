import 'dart:async';
import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/bottom_sheet/bottom_sheet.dart';
import 'package:izi_bus/modules/components/buses.temp.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/components/directions_model.dart';
import 'package:izi_bus/modules/components/stops.temp.dart';
import 'package:izi_bus/modules/lines_page/lines_page.dart';
import 'package:izi_bus/modules/stops_page/stops_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izi_bus/utils/custom_marker_icon.dart';

import '../../shared/themes/app_colors.dart';
import '../components/directions_repository.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Markers do mapa
  final List<Marker> stopsMarkers = <Marker>[];
  final List<Marker> markers = <Marker>[];
  final List<LatLng> _directions = <LatLng>[];

  // Posição inicial do mapa
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(-26.2295, -52.6716),
    zoom: 15,
  );

  final Completer<GoogleMapController> _controller = Completer();
  late GoogleMapController _googleMapController;

  Future<void> _setMapInitialPosition() async {
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }

  Future<void> _onTapMarker(String id, double lat, double long) async {
    _directions.clear();
    List<String> st = <String>[];
    List<int> stop = <int>[];
    List<LatLng> teste = <LatLng>[];
    Directions directions;
    dynamic bus = buses.indexWhere((element) => element['id'] == id);
    for (var stop in buses[bus]['ponts']) {
      st.add(stop);
    }
    for (var i = 0; i < st.length; i++) {
      dynamic index = stops.indexWhere((element) => element['id'] == st[i]);
      stop.add(index);
    }
    for (var i = 0; i < stop.length - 1; i++) {
      LatLng origin = LatLng(stops[stop[i]]['lat'], stops[stop[i]]['long']);

      LatLng destiny =
          LatLng(stops[stop[i + 1]]['lat'], stops[stop[i + 1]]['long']);
      directions = await _rota(origin, destiny);
      _directions.insertAll(
          _directions.length,
          directions.polylinePoints
              .map((e) => LatLng(e.latitude, e.longitude)));
      print("em cima");
    }
    setState(() {});
  }

  Future<Directions> _rota(LatLng des, LatLng pos) async {
    Directions dir = await DirectionsRepository()
        .getDirections(origin: des, destination: pos);
    return dir;
  }

  Future<void> _addInitialMarkers() async {
    for (var bus in buses) {
      markers.add(
        Marker(
            markerId: MarkerId(bus['id']),
            icon: BitmapDescriptor.fromBytes(
                await customMarkerIcon('lib/assets/bus_icon.png', 60)),
            position: LatLng(bus['lat'], bus['long']),
            onTap: () {
              _onTapMarker(bus['id'], bus['lat'], bus['long']);
            }),
      );
    }
    markers.add(
      Marker(
        markerId: const MarkerId('user'),
        icon: BitmapDescriptor.fromBytes(
            await customMarkerIcon('lib/assets/bus_icon.png', 20)),
        position: _initialCameraPosition.target,
      ),
    );
    for (var stop in stops) {
      markers.add(Marker(
          markerId: MarkerId(stop['id']),
          icon: BitmapDescriptor.fromBytes(
              await customMarkerIcon('lib/assets/pin_icon.png', 60)),
          position: LatLng(stop['lat'], stop['long']),
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))),
                builder: (context) {
                  return const CustomBottomSheet(
                      child: StopsPage(stopName: "Casa do Artesão"));
                });
          }));
    }

    setState(() {});
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initialCameraPosition,
            zoomGesturesEnabled: true,
            myLocationButtonEnabled: true,
            rotateGesturesEnabled: true,
            tiltGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _setMapInitialPosition();
              _addInitialMarkers();
              _controller.complete(controller);
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('overview_polyline'),
                color: AppColors.primary,
                width: 5,
                points: _directions,
              ),
            },
            markers: Set<Marker>.of(markers),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 40, right: 40),
              child: Button(
                text: "VER AS LINHAS DE ÔNIBUS",
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16))),
                      builder: (context) {
                        return const CustomBottomSheet(child: LinesPage());
                      });
                },
              )),
        ],
      ),
    );
  }
}
