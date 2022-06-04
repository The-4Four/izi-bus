import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:izi_bus/modules/components/text_input/text_input.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

class RechargeUserCardPage extends StatelessWidget {
  const RechargeUserCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 72, left: 24, right: 24, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              child: const Icon(Icons.arrow_back, size: 32),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: RichText(
                  text: TextSpan(
                      text: "Recarga de cartão", style: TextStyles.title)),
            ),
            Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: TextInput(
                    placeholder: "Valor", validator: (String? value) {})),
            Button(text: "Forma de pagamento", onPressed: () {}),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Button(
                  text: "Finalizar recarga",
                  onPressed: () {},
                  disabled: true,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
