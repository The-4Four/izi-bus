import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/modules/home/home.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Izi Bus',
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      home: const Home(),
    );
  }
}
