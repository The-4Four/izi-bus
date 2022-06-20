import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izi_bus/shared/auth/auth_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = AuthController();

    authController.hasCurrentUser(context);

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
        )
      ],
    ));
  }
}
