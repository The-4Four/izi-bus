import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class LineCard extends StatefulWidget {
  final String code;
  final String description;
  final List schedules;
  const LineCard(
      {Key? key,
      required this.code,
      required this.description,
      required this.schedules})
      : super(key: key);

  @override
  State<LineCard> createState() => _LineCardState();
}

class _LineCardState extends State<LineCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      childrenPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      title: Text("Linha " + widget.code, style: TextStyles.cardTitle),
      subtitle: Text(widget.description, style: TextStyles.cardCaption),
      trailing: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: AppColors.primary,
          ),
          width: 40,
          height: 40,
          child: const Icon(Icons.map, size: 16, color: AppColors.background)),
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) =>
                _buildScheduleItem(widget.schedules[index]),
            itemCount: widget.schedules.length)
      ],
    );
  }
}

Widget _buildScheduleItem(item) {
  return ListTile(
    title: Text(item['spot'], style: TextStyles.listFirst),
    trailing: Text(item['time'], style: TextStyles.listFirst),
  );
}
