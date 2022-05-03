import 'package:flutter/material.dart';
import 'package:izi_bus/routes.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Izi Bus',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
      ),
      initialRoute: '/',
      //home: const Home(),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
