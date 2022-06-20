import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_images.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPress;
  const SocialLoginButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 3,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ]),
      child: TextButton(
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppImages.google, height: 24),
              const SizedBox(width: 16),
              Text(
                "CONTINUAR COM GOOGLE",
                style: TextStyles.socialLoginText,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
