import 'package:flutter/material.dart';
import 'package:izi_bus/modules/cards/cards.dart';
import 'package:izi_bus/modules/home/home.dart';
import 'package:izi_bus/modules/lines_page/lines_page.dart';
import 'package:izi_bus/modules/login/login_page.dart';
import 'package:izi_bus/modules/recharge_user_card/recharge_user_card.dart';
import 'package:izi_bus/modules/register_card/register_card.dart';
import 'package:izi_bus/modules/splash_screen/splash_screen.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/lines_page':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => const LinesPage());
        }
        return _errorRoute();
      case '/recharge_user_card':
        return MaterialPageRoute(builder: (_) => const RechargeUserCardPage());
      case '/register_card':
        return MaterialPageRoute(builder: (_) => const RegisterCard());
      case '/card':
        return MaterialPageRoute(builder: (_) => const Cards());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
