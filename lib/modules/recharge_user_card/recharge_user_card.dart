import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/bottom_sheet/bottom_sheet.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/components/credit_card_info.temp.dart';
import 'package:izi_bus/modules/recharge_user_card/components/beneficiaryBankAccountInfo/beneficiary_bank_account_info.dart';
import 'package:izi_bus/modules/recharge_user_card/components/paymentTypeBottomSheet/payment_type_bottom_sheet.dart';
import 'package:izi_bus/modules/recharge_user_card/components/pixClipBoard/pix_clip_board.dart';
// import 'package:izi_bus/modules/recharge_user_card/components/placeholderButton/placeholder_button.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:izi_bus/modules/components/text_input/text_input.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/utils/is_number.dart';
import 'package:izi_bus/utils/is_valid_currency.dart';

enum PaymentType { none, pix, transfer, creditCard }

class RechargeUserCardPage extends StatefulWidget {
  const RechargeUserCardPage({Key? key}) : super(key: key);

  @override
  State<RechargeUserCardPage> createState() => _RechargeUserCardPageState();
}

class _RechargeUserCardPageState extends State<RechargeUserCardPage> {
  PaymentType selectedPaymentType = PaymentType.none;
  final formKey = GlobalKey<FormState>();
  String buttonText = 'FORMA DE PAGAMENTO';
  bool finishedButtonDisabled = true;
  late int selectedCardIndex;

  Widget getPaymentTypeWidget(context) {
    if (selectedPaymentType == PaymentType.pix) {
      setState(() {
        finishedButtonDisabled = false;
      });
      return PixClipBoard(clipboardContext: context);
    } else if (selectedPaymentType == PaymentType.transfer) {
      setState(() {
        finishedButtonDisabled = false;
      });
      return BeneficiaryBankAccountInfo();
    } else if (selectedPaymentType == PaymentType.creditCard) {
      setState(() {
        finishedButtonDisabled = false;
      });
    }

    selectedPaymentType = PaymentType.none;
    return Container();
  }

  void refresh(dynamic childValue, int? creditCardIndex) {
    setState(() {
      selectedPaymentType = childValue;
      if (selectedPaymentType == PaymentType.pix) {
        buttonText = 'PIX';
      } else if (selectedPaymentType == PaymentType.transfer) {
        buttonText = 'TRANSFERÊNCIA';
      } else if (selectedPaymentType == PaymentType.creditCard) {
        if (creditCardIndex != null) {
          selectedCardIndex = creditCardIndex;
          buttonText = cards.elementAt(creditCardIndex)['name'];
        } else {
          buttonText = 'CARTÃO DE CRÉDITO';
        }
      } else {
        buttonText = 'FORMA DE PAGAMENTO';
      }
      finishedButtonDisabled = false;
    });
  }

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
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: RichText(
                    text: TextSpan(
                        text: "Recarga de cartão", style: TextStyles.title)),
              ),
              TextInput(
                  placeholder: "Valor",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Esse campo é obrigatório";
                    }

                    if (!isValidCurrency(value) && !isNumber(value)) {
                      return "Campo incorreto";
                    }
                    return null;
                  },
                  textInputType: TextInputType.number),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Button(
                      text: buttonText,
                      onPressed: () {
                        showModalBottomSheet<dynamic>(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16))),
                            builder: (context) {
                              return CustomBottomSheet(
                                  child: PaymentTypeBottomSheet(
                                notifyParent: refresh,
                              ));
                            });
                      })),
              getPaymentTypeWidget(context),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Button(
                    text: "Finalizar recarga",
                    onPressed: () {
                      // Validar formulário de recarga de cartão
                      if (formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, "/");
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
