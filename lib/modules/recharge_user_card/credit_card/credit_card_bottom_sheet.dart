import 'package:flutter/widgets.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/recharge_user_card/credit_card/credit_card.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';
import 'package:izi_bus/modules/components/credit_card_info.temp.dart';

class CreditCardBottomSheet extends StatefulWidget {
  final Function notifyParent;
  const CreditCardBottomSheet({Key? key, required this.notifyParent})
      : super(key: key);

  @override
  State<CreditCardBottomSheet> createState() => _CreditCardBottomSheetState();
}

class _CreditCardBottomSheetState extends State<CreditCardBottomSheet> {
  Widget getCardList(context) {
    if (creditCards.isNotEmpty) {
      return Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.75),
        child: Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  _buildLineCard(creditCards[index], index),
              itemCount: creditCards.length),
        ),
      );
    } else {
      return Text("Nenhum cartão de crédito cadastrado",
          style: TextStyles.mediumTextBlack);
    }
  }

  void refresh() {
    setState(() {});
  }

  Widget _buildLineCard(CreditCardList item, int index) {
    return CreditCard(
      name: item.name,
      index: index,
      notifyParent: widget.notifyParent,
    );
  }

// Essa função aguarda o resultado do cadastro do cartão para atualizar o bottom sheet
  Future<void> _navigateToRegisterCreditCard(BuildContext context) async {
    final result = await Navigator.pushNamed(context, "/register_credit_card");
    if (result == 'Success') {
      refresh();
    }
  }

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
              onPressed: () {
                _navigateToRegisterCreditCard(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
