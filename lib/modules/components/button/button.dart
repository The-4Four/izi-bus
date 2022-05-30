import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(4)),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.button,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
