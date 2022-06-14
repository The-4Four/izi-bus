import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class CreditCard extends StatefulWidget {
  final String name;
  const CreditCard({Key? key, required this.name}) : super(key: key);

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.credit_card, size: 24, color: AppColors.primary)),
        Text(widget.name, style: TextStyles.cardTitle),
      ],
    );
  }
}

// const Icon(Icons.credit_card, size: 24, color: AppColors.primary),
//        Text(widget.name, style: TextStyles.cardTitle),
