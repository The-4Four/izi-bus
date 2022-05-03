import 'package:flutter/material.dart';
import 'package:izi_bus/modules/lines_page/lines_page.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
          child: GestureDetector(
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LinesPage()))
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
      )),
    );
  }
}
