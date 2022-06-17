import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/components/social_login_button/social_login_button.dart';
import 'package:izi_bus/modules/login/login_page_controller.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageController loginController = LoginPageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final Widget busSvg = SvgPicture.asset(
      'lib/assets/bus-logo.svg',
      semanticsLabel: 'Bus',
      height: 60,
    );

    final Widget iziSvg =
        SvgPicture.asset('lib/assets/izibus-logo.svg', semanticsLabel: 'Izi');

    return Scaffold(
        backgroundColor: AppColors.background,
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 140),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [iziSvg, const SizedBox(width: 10), busSvg],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SocialLoginButton(onPress: () async {
                        loginController.googleSigIn(context);
                      }),
                      const SizedBox(height: 8),
                      Button(
                        text: "Continuar sem login",
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        variant: 'transparent',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
