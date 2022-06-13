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
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(patttern);
  if (value?.length != null) {
    return "Informe o nome";
  } else if (!regExp.hasMatch(value!)) {
    return "O nome deve conter caracteres de a-z ou A-Z";
  }
  return null as String;
}

class _RegisterCardState extends State<RegisterCard> {
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
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextInput(
                            placeholder: "Seu Cpf",
                            validator: _validateName,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextInput(
                            placeholder: "ID do cartão",
                            validator: _validateName,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextInput(
                            placeholder: "Nome do cartão",
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
