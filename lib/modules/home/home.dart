import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:izi_bus/modules/components/bottom_sheet/bottom_sheet.dart';
import 'package:izi_bus/modules/components/buses.temp.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/components/directions_model.dart';
import 'package:izi_bus/modules/components/stops.temp.dart';
import 'package:izi_bus/modules/homeController/homeController.dart';
import 'package:izi_bus/modules/lines_page/lines_page.dart';
import 'package:izi_bus/modules/stops_page/stops_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:izi_bus/shared/auth/auth_controller.dart';
import 'package:izi_bus/shared/models/user_model.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:izi_bus/utils/custom_marker_icon.dart';

import '../../shared/themes/app_colors.dart';
import '../components/directions_repository.dart';

class Home extends StatefulWidget {
  final UserModel? user;
  const Home({Key? key, this.user}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Markers do mapa
  final List<Marker> stopsMarkers = <Marker>[];
  final List<Marker> markers = <Marker>[];
  final List<LatLng> _directions = <LatLng>[];

  final homeController = HomeController();
  late Position _currentPosition;

  final AuthController authController = AuthController();

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

  Future<void> _setUserInitialPosition() async {
    Position position = await homeController.determinePosition() as Position;
    setState(() {
      _currentPosition = position;
    });
  }

  Future<void> _onTapMarker(String id, double lat, double long) async {
    _directions.clear();
    List<String> st = <String>[];
    List<int> stop = <int>[];
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

  AppBar _appBar(height) => AppBar(
        toolbarHeight: height,
        flexibleSpace: Container(
          color: AppColors.background,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 24, left: 24.0, right: 24.0, bottom: 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Olá, ", style: TextStyles.listFirst),
                          Text(
                            widget.user!.name,
                            style: TextStyles.mediumBoldText,
                          )
                        ],
                      ),
                      Text(
                        "Para onde deseja ir hoje?",
                        style: TextStyles.smallText,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      authController.handleSignOut(context);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColors.primary,
                      radius: 25,
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(widget.user!.photoUrl!),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      );

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.user!.name != '' ? _appBar(72.0) : null,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initialCameraPosition,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            rotateGesturesEnabled: true,
            myLocationEnabled: true,
            trafficEnabled: false,
            tiltGesturesEnabled: true,
            onMapCreated: (GoogleMapController controller) async {
              await _setUserInitialPosition();
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
          widget.user!.name != ''
              ? Expanded(
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0, top: 8),
                          child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                color: AppColors.secondary,
                              ),
                              width: 40,
                              height: 40,
                              child: const Icon(Icons.credit_card,
                                  size: 24, color: AppColors.background)),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, "/card");
                        },
                      )))
              : Container(),
        ],
      ),
    );
  }
}
