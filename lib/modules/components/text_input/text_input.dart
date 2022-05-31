import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

/// Um input de texto para ser usado dentro de formulários
///
/// Parâmetros:
/// - placeholder: string que será usada para ajudar o usuário a preencher o input
/// - validator: método para validar o input do usuário
///   - Como usar? (String? value) { **validação** }
/// - textInputType: tipo do teclado ao selecionar o input
class TextInput extends StatelessWidget {
  final String placeholder;
  final String? Function(String? value) validator;
  final TextInputType? textInputType;

  const TextInput(
      {Key? key,
      required this.placeholder,
      required this.validator,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        keyboardType: textInputType ?? TextInputType.text,
        style: TextStyles.inputLabel,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            labelText: placeholder,
            labelStyle: TextStyles.inputLabel,
            focusColor: AppColors.primary,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 2)),
            errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.secondary, width: 2)),
            filled: true,
            fillColor: AppColors.elevation,
            enabledBorder: InputBorder.none));
  }
}
