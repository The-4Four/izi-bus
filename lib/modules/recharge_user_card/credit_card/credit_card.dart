import 'package:flutter/material.dart';
import 'package:izi_bus/modules/recharge_user_card/recharge_user_card.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class CreditCard extends StatefulWidget {
  final String name;
  final int index;
  final Function notifyParent;
  const CreditCard(
      {Key? key,
      required this.name,
      required this.index,
      required this.notifyParent})
      : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () => {
              widget.notifyParent(PaymentType.creditCard, widget.index),
              Navigator.pop(context)
            },
            icon: const Icon(Icons.credit_card,
                size: 24, color: AppColors.primary),
            label: Text(widget.name, style: TextStyles.cardTitle),
            style: ElevatedButton.styleFrom(
                primary: AppColors.background,
                alignment: Alignment.center,
                shadowColor: AppColors.primary,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 48)),
          ),
        ],
      ),
    );
  }
}
