import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class ListCard extends StatefulWidget {
  final String id;
  final String nameCard;
  final String value;
  const ListCard(
      {Key? key, required this.id, required this.nameCard, required this.value})
      : super(key: key);

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.add_card_outlined),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.nameCard, style: TextStyles.mediumBoldText),
                  Text(widget.id, style: TextStyles.cardCaption),
                ],
              ),
            ],
          ),
          Text("R\$ " + widget.value, style: TextStyles.smallText),
        ],
      ),
    );
  }
}
