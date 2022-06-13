import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

class HomeController extends StatefulWidget {
  const HomeController({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomeController> {
  late Position _currentPosition;
  @override
  void initState() {
    _getThingsOnStartup().then((value) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Widget busSvg = SvgPicture.asset(
      'lib/assets/bus-logo.svg',
      semanticsLabel: 'Bus',
      height: 60,
    );
    final Widget iziSvg =
        SvgPicture.asset('lib/assets/izibus-logo.svg', semanticsLabel: 'Izi');

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: iziSvg,
            ),
            busSvg
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        TextButton(
          child: const Text(""),
          onPressed: () {
            determinePosition();
          },
        ),
      ],
    ));
  }

  Future<Position?> determinePosition() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = position;
    });
    return _currentPosition;
    // Ask permission from device
  }

  Future _getThingsOnStartup() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushNamed(context, '/home');
  }
}
