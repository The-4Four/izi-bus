import 'dart:async';
import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/stops_temp.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Marker> _markers = <Marker>[];

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

  void _addInitialMarkers() {
    stops.forEach((stop) {
      _markers.add(Marker(
          markerId: MarkerId(stop['id']),
          position: LatLng(stop['lat'], stop['long'])));
    });
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
            myLocationButtonEnabled: false,
            rotateGesturesEnabled: true,
            tiltGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _setMapInitialPosition();
              _controller.complete(controller);
            },
            markers: Set<Marker>.of(_markers),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: GestureDetector(
              onTap: () => {
                Navigator.of(context)
                    .pushNamed('/lines_page', arguments: "Show lines")
              },
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.primary,
                ),
                width: 240,
                height: 56,
                alignment: Alignment.center,
                child: Text(
                  "VER AS LINHAS DE ÔNIBUS",
                  style: TextStyles.button,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        onPressed: () {
          _addInitialMarkers();
        },
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
