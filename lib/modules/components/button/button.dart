import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? disabled;
  final String? variant;

  const Button(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.disabled,
      this.variant})
      : super(key: key);

  getButtonColors() {
    if (disabled == true && disabled != null) {
      return [AppColors.disabledButton, TextStyles.button];
    }

    if (variant == 'transparent') {
      return [AppColors.background, TextStyles.transparentButton];
    }

    return [AppColors.primary, TextStyles.button];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: getButtonColors()[0], borderRadius: BorderRadius.circular(4)),
      child: TextButton(
        onPressed: disabled == false || disabled == null ? onPressed : () {},
        child: Text(
          text.toUpperCase(),
          style: getButtonColors()[1],
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
