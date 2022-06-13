import 'package:flutter/widgets.dart';
import 'package:izi_bus/modules/components/button/button.dart';

class EditCard extends StatelessWidget {
  const EditCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        children: [
          Button(
            text: "Recarregar",
            onPressed: () {
              Navigator.pushNamed(context, "/recharge_user_card");
            },
          ),
          const SizedBox(height: 12),
          Button(
            text: "Editar",
            onPressed: () {},
            variant: "transparent",
          ),
          const SizedBox(height: 12),
          Button(
            text: "Excluir",
            onPressed: () {},
            variant: "transparent",
          )
        ],
      ),
    );
  }
}
