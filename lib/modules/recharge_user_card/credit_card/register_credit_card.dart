import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/components/credit_card_info.temp.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:izi_bus/modules/components/text_input/text_input.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/utils/is_number.dart';
import 'package:izi_bus/utils/is_valid_currency.dart';

class RegisterCreditCard extends StatefulWidget {
  const RegisterCreditCard({Key? key}) : super(key: key);

  @override
  State<RegisterCreditCard> createState() => _RegisterCreditCardState();
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

class _RegisterCreditCardState extends State<RegisterCreditCard> {
  final formKey = GlobalKey<FormState>();
  bool finishedButtonDisabled = true;
  final cardNameController = TextEditingController();
  final cardHolderController = TextEditingController();
  final idController = TextEditingController();
  final validityController = TextEditingController();
  final cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: Padding(
        padding:
            const EdgeInsets.only(top: 72, left: 24, right: 24, bottom: 40),
        child: Form(
          key: formKey,
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
                padding: const EdgeInsets.only(top: 16, bottom: 0),
                child: RichText(
                    text: TextSpan(
                        text: "Cartão de crédito", style: TextStyles.title)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0, bottom: 24),
                child: RichText(
                    text: TextSpan(
                        text: "Informe os dados do seu cartão",
                        style: TextStyles.smallText)),
              ),
              SizedBox(
                height: 88,
                child: TextInput(
                  placeholder: "Apelido do cartão",
                  controller: cardNameController,
                  validator: _validateName,
                ),
              ),
              SizedBox(
                height: 88,
                child: TextInput(
                  placeholder: "Nome do titular",
                  controller: cardHolderController,
                  validator: _validateName,
                ),
              ),
              SizedBox(
                height: 88,
                child: TextInput(
                    placeholder: "Número do cartão",
                    controller: idController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Esse campo é obrigatório";
                      } else if (!isValidCurrency(value) && !isNumber(value)) {
                        return "Campo incorreto";
                      }
                      return null;
                    },
                    textInputType: TextInputType.number),
              ),
              LayoutBuilder(builder: ((context, constraints) {
                return Row(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth * 0.60,
                      height: 88,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: TextInput(
                            placeholder: "Validade",
                            controller: validityController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Esse campo é obrigatório";
                              } else if (!isValidCurrency(value) &&
                                  !isNumber(value)) {
                                return "Campo incorreto";
                              }
                              return null;
                            },
                            textInputType: TextInputType.number),
                      ),
                    ),
                    SizedBox(
                      width: constraints.maxWidth * 0.40,
                      height: 88,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: TextInput(
                            placeholder: "CVV",
                            controller: cvvController,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "Esse campo é obrigatório";
                              } else if (!isValidCurrency(value) &&
                                  !isNumber(value)) {
                                return "Campo incorreto";
                              }
                              return null;
                            },
                            textInputType: TextInputType.number),
                      ),
                    ),
                  ],
                );
              })),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Button(
                    text: "Cadastrar",
                    onPressed: () {
                      // Validar formulário de recarga de cartão
                      if (formKey.currentState!.validate()) {
                        creditCards.add(CreditCardList(
                            name: cardNameController.text,
                            holder: cardHolderController.text,
                            id: idController.text,
                            validity: validityController.text,
                            securityCode: cvvController.text));
                        Navigator.pop(context, 'Success');
                      }
                    },
                    disabled: false,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
