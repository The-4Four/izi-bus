import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/bottom_sheet/bottom_sheet.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/recharge_user_card/components/beneficiaryBankAccountInfo/beneficiary_bank_account_info.dart';
import 'package:izi_bus/modules/recharge_user_card/components/paymentTypeBottomSheet/payment_type_bottom_sheet.dart';
import 'package:izi_bus/modules/recharge_user_card/components/pixClipBoard/pix_clip_board.dart';
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
  final PaymentType selectedPaymentType = PaymentType.none;
  final formKey = GlobalKey<FormState>();
  bool finishedButtonDisabled = true;

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
    }

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  },
                  textInputType: TextInputType.number),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Button(
                      text: "Forma de pagamento",
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16))),
                            builder: (context) {
                              return const CustomBottomSheet(
                                  child: PaymentTypeBottomSheet());
                            });
                      })),
              Container(child: getPaymentTypeWidget(context)),
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
