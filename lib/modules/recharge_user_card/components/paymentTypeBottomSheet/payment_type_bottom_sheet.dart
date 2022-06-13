import 'package:flutter/widgets.dart';
import 'package:izi_bus/modules/components/button/button.dart';

class PaymentTypeBottomSheet extends StatelessWidget {
  const PaymentTypeBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Button(
            text: "Pix",
            onPressed: () {},
            variant: "transparent",
          ),
          const SizedBox(height: 12),
          Button(
            text: "Cartão de crédito",
            onPressed: () {},
            variant: "transparent",
          ),
          const SizedBox(height: 12),
          Button(
            text: "Transferência",
            onPressed: () {},
            variant: "transparent",
          )
        ],
      ),
    );
  }
}
