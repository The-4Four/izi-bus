import 'package:flutter/widgets.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class BankAccountInfo {
  String account = "1234567-8";
  String agency = "1011";
  String cnpj = "45.142.125/0001-94";
  String ownerName = "Cinglair Capello";
}

class BeneficiaryBankAccountInfo extends StatelessWidget {
  final BankAccountInfo bankAccountInfo = BankAccountInfo();

  BeneficiaryBankAccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: RichText(
            text: TextSpan(
                text: "Dados para transferência", style: TextStyles.smallText)),
      ),
      Container(
          decoration: BoxDecoration(
              color: AppColors.elevation,
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Conta: ", style: TextStyles.mediumBoldText)),
                    RichText(
                        text: TextSpan(
                            text: bankAccountInfo.account,
                            style: TextStyles.mediumText))
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Agência: ",
                            style: TextStyles.mediumBoldText)),
                    RichText(
                        text: TextSpan(
                            text: bankAccountInfo.agency,
                            style: TextStyles.mediumText))
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "CNPJ: ", style: TextStyles.mediumBoldText)),
                    RichText(
                        text: TextSpan(
                            text: bankAccountInfo.cnpj,
                            style: TextStyles.mediumText))
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "Titular: ",
                            style: TextStyles.mediumBoldText)),
                    RichText(
                        text: TextSpan(
                            text: bankAccountInfo.ownerName,
                            style: TextStyles.mediumText))
                  ],
                )
              ],
            ),
          ))
    ]);
  }
}
