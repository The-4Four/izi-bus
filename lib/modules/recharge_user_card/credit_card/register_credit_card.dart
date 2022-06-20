import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/components/credit_card_info.temp.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:izi_bus/modules/components/text_input/text_input.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/utils/is_number.dart';
import 'package:izi_bus/utils/is_valid_currency.dart';
import 'package:izi_bus/utils/is_valid_date.dart';

class RegisterCreditCard extends StatefulWidget {
  const RegisterCreditCard({Key? key}) : super(key: key);

  @override
  State<RegisterCreditCard> createState() => _RegisterCreditCardState();
}

String? _validateCardName(String? value) {
  String pattern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(pattern);
  if (value != null && value.isEmpty) {
    return "Informe o nome";
  } else if (!regExp.hasMatch(value!)) {
    return "O nome deve conter caracteres de a-z ou A-Z";
  }
  for (int i = 0; i < creditCards.length; i++) {
    if (value == creditCards[i].name) {
      return "Esse nome já está sendo utilizado";
    }
  }
  return null;
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

bool getMonthAndYear(String value) {
  DateTime now = DateTime.now();
  if (value.length == 4) {
    if ((int.parse(now.year.toString().substring(2, 4)) <=
        int.parse(value.substring(2, 4)))) {
      if ((int.parse(now.year.toString().substring(2, 4)) ==
              int.parse(value.substring(2, 4))) &&
          now.month > int.parse(value.substring(0, 2))) {
        return false;
      }
      return true;
    }
    return false;
  } else if (value.length == 5) {
    if ((int.parse(now.year.toString().substring(2, 4)) <=
        int.parse(value.substring(3, 5)))) {
      if ((int.parse(now.year.toString().substring(2, 4)) ==
              int.parse(value.substring(3, 5))) &&
          now.month > int.parse(value.substring(0, 2))) {
        return false;
      }
      return true;
    }
    return false;
  } else if (value.length == 6) {
    if ((now.year <= int.parse(value.substring(2, 6)))) {
      if (now.year == int.parse(value.substring(2, 6)) &&
          now.month > int.parse(value.substring(0, 2))) {
        return false;
      }
      return true;
    }
    return false;
  } else if (value.length == 7) {
    if ((now.year <= int.parse(value.substring(3, 7)))) {
      if (now.year == int.parse(value.substring(3, 7)) &&
          now.month > int.parse(value.substring(0, 2))) {
        return false;
      }
      return true;
    }
    return true;
  }
  return false;
}

String? _validateDate(String? value) {
  if (value == null || value.isEmpty) {
    return "Esse campo é obrigatório";
  } else if (!isValidDate(value)) {
    return "Esse campo deve ser no formato MM/AAAA ou MMAAAA ";
  } else if (!getMonthAndYear(value)) {
    return "Data inválida";
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
      // resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: Padding(
          padding:
              const EdgeInsets.only(top: 72, left: 24, right: 24, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
              Form(
                  key: formKey,
                  child: Expanded(
                      child: SingleChildScrollView(
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: TextInput(
                              placeholder: "Apelido do cartão",
                              controller: cardNameController,
                              validator: _validateCardName,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: TextInput(
                              placeholder: "Nome do titular",
                              controller: cardHolderController,
                              validator: _validateName,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: TextInput(
                                placeholder: "Número do cartão",
                                controller: idController,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return "Esse campo é obrigatório";
                                  } else if (!isValidCurrency(value) &&
                                      !isNumber(value)) {
                                    return "Campo incorreto";
                                  } else if (value.length != 16) {
                                    return "Esse campo deve ter 3 dígitos";
                                  }
                                  return null;
                                },
                                textInputType: TextInputType.number),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 4, 4, 8),
                                  child: TextInput(
                                      placeholder:
                                          "Validade (MM/AAAA ou MM/AA)",
                                      controller: validityController,
                                      validator: _validateDate,
                                      textInputType: TextInputType.datetime),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(4, 4, 0, 8),
                                  child: TextInput(
                                      placeholder: "CVV",
                                      controller: cvvController,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return "Esse campo é obrigatório";
                                        } else if (!isValidCurrency(value) &&
                                            !isNumber(value)) {
                                          return "Campo incorreto";
                                        } else if (value.length != 3) {
                                          return "Esse campo deve ter 3 dígitos";
                                        }
                                        return null;
                                      },
                                      textInputType: TextInputType.number),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))),
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 0, left: 24, right: 24, bottom: 40),
        child: Button(
          text: "Cadastrar",
          onPressed: () {
            // Validar formulário de cadastro de cartão
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
    );
  }
}
