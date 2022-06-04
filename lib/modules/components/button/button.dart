import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? disabled;

  const Button(
      {Key? key, required this.text, required this.onPressed, this.disabled})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: disabled == false || disabled == null
              ? AppColors.primary
              : AppColors.disabledButton,
          borderRadius: BorderRadius.circular(4)),
      child: TextButton(
        onPressed: disabled == false || disabled == null ? onPressed : () {},
        child: Text(
          text.toUpperCase(),
          style: TextStyles.button,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
