import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/bottom_sheet/bottom_sheet.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/recharge_user_card/credit_card/credit_card_bottom_sheet.dart';
import 'package:izi_bus/modules/recharge_user_card/recharge_user_card.dart';

class PaymentTypeBottomSheet extends StatefulWidget {
  final Function notifyParent;
  const PaymentTypeBottomSheet({Key? key, required this.notifyParent})
      : super(key: key);

  @override
  State<PaymentTypeBottomSheet> createState() => _PaymentTypeBottomSheetState();
}

class _PaymentTypeBottomSheetState extends State<PaymentTypeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Button(
            text: "Pix",
            onPressed: () =>
                {widget.notifyParent(PaymentType.pix), Navigator.pop(context)},
            variant: "transparent",
          ),
          const SizedBox(height: 12),
          Button(
            text: "Cartão de crédito",
            onPressed: () => {
              widget.notifyParent(PaymentType.creditCard),
              Navigator.pop(context),
              showModalBottomSheet<dynamic>(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16))),
                  builder: (context) {
                    return const CustomBottomSheet(
                        child: CreditCardBottomSheet());
                  })
            },
            variant: "transparent",
          ),
          const SizedBox(height: 12),
          Button(
            text: "Transferência",
            onPressed: () => {
              widget.notifyParent(PaymentType.transfer),
              Navigator.pop(context)
            },
            variant: "transparent",
          )
        ],
      ),
    );
  }
}
