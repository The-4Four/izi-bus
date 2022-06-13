import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class PixClipBoard extends StatelessWidget {
  final String pixKey = "TCubU{e+es&tLRwMVyTd";
  final BuildContext clipboardContext;

  const PixClipBoard({Key? key, required this.clipboardContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: RichText(
            text: TextSpan(
                text: "Chave pix para pagamento", style: TextStyles.smallText)),
      ),
      Container(
          height: 52,
          decoration: BoxDecoration(
              color: AppColors.elevation,
              borderRadius: BorderRadius.circular(4)),
          child: TextButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: pixKey)).then((_) {
                ScaffoldMessenger.of(clipboardContext).showSnackBar(
                    const SnackBar(
                        content: Text(
                            "Chave pix copiada para área de transferência")));
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  RichText(
                      text:
                          TextSpan(text: pixKey, style: TextStyles.inputLabel)),
                  const Spacer(),
                  const Icon(Icons.copy, color: AppColors.inputPlaceholder)
                ],
              ),
            ),
          ))
    ]);
  }
}
