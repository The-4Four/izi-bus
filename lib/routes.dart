import 'package:flutter/material.dart';
import 'package:izi_bus/modules/home/home.dart';
import 'package:izi_bus/modules/lines_page/lines_page.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/lines_page':
        if (args is String) {
          return MaterialPageRoute(builder: (_) => const LinesPage());
        }
        return _errorRoute();
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
