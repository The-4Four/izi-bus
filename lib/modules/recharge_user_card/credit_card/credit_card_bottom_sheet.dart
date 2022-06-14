import 'package:flutter/widgets.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/recharge_user_card/credit_card/credit_card.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:izi_bus/modules/components/credit_card_info.temp.dart';

class CreditCardBottomSheet extends StatefulWidget {
  const CreditCardBottomSheet({Key? key}) : super(key: key);

  @override
  State<CreditCardBottomSheet> createState() => _CreditCardBottomSheetState();
}

Widget getCardList(context) {
  if (cards.isNotEmpty) {
    return SizedBox(
      child: Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => _buildLineCard(cards[index]),
            itemCount: cards.length),
      ),
    );
  } else {
    return Text("Nenhum cartão de crédito cadastrado",
        style: TextStyles.mediumTextBlack);
  }
}

Widget _buildLineCard(item) {
  return CreditCard(name: item['name']);
}

class _CreditCardBottomSheetState extends State<CreditCardBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        children: [
          getCardList(context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Button(
              text: "Cadastrar um novo cartão",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
