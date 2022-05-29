import 'dart:async';
import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/bottom_sheet/bottom_sheet.dart';
import 'package:izi_bus/modules/components/buses.temp.dart';
import 'package:izi_bus/modules/components/stops.temp.dart';
import 'package:izi_bus/modules/lines_page/lines_page.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izi_bus/utils/custom_marker_icon.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Markers do mapa
  final List<Marker> stopsMarkers = <Marker>[];
  final List<Marker> busesMarkers = <Marker>[];
  final List<Marker> mapMarkers = <Marker>[];

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

  Future<void> _addInitialStopsMarkers() async {
    for (var stop in stops) {
      stopsMarkers.add(Marker(
        markerId: MarkerId(stop['id']),
        icon: BitmapDescriptor.fromBytes(
            await customMarkerIcon('lib/assets/pin_icon.png', 80)),
        position: LatLng(stop['lat'], stop['long']),
      ));
    }

    setState(() {});
  }

  Future<void> _addInitialBusesMarkers() async {
    for (var bus in buses) {
      busesMarkers.add(Marker(
        markerId: MarkerId(bus['id']),
        icon: BitmapDescriptor.fromBytes(
            await customMarkerIcon('lib/assets/bus_icon.png', 80)),
        position: LatLng(bus['lat'], bus['long']),
      ));
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
            myLocationButtonEnabled: false,
            rotateGesturesEnabled: true,
            tiltGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _setMapInitialPosition();
              _controller.complete(controller);
              _addInitialStopsMarkers();
              _addInitialBusesMarkers();
            },
            markers: Set<Marker>.of(busesMarkers),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: GestureDetector(
              onTap: () => {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(16))),
                    builder: (context) {
                      return const CustomBottomSheet(child: LinesPage());
                    })
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
        onPressed: () {},
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
