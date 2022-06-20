import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/components/text_input/text_input.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({Key? key}) : super(key: key);

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

String? _validateName(String? value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value != null && value.isEmpty) {
    return "Informe o nome";
  } else if (!regExp.hasMatch(value!)) {
    return "O nome deve conter caracteres de a-z ou A-Z";
  }
  return null;
}

class _RegisterCardState extends State<RegisterCard> {
  final cpfController = TextEditingController();
  final idController = TextEditingController();
  final cardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 72, left: 24, right: 24, bottom: 40),
          child: Column(
            children: <Widget>[
              Column(
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
                            text: "Informe os dados do cartão",
                            style: TextStyles.title)),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextInput(
                            placeholder: "Seu Cpf",
                            controller: cpfController,
                            validator: _validateName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextInput(
                            placeholder: "ID do cartão",
                            controller: idController,
                            validator: _validateName,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextInput(
                            placeholder: "Nome do cartão",
                            controller: cardNameController,
                            validator: _validateName,
                          ),
                        ),
                      ]),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Button(
                    text: "Cadastrar Cartão",
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
