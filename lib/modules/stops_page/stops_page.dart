import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/line_card.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/modules/components/lines.temp.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class StopsPage extends StatelessWidget {
  final String stopName;

  const StopsPage({Key? key, required this.stopName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Padding(
            child: Text(stopName, style: TextStyles.cardTitle),
            padding: EdgeInsets.only(bottom: 32)),
        ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => _buildLineCard(lines[index]),
            separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  indent: 16,
                  endIndent: 16,
                  color: AppColors.divider,
                ),
            itemCount: lines.length),
      ]),
    );
  }
}

Widget _buildLineCard(item) {
  return LineCard(
      code: item['code'],
      description: item['description'],
      schedules: item['schedules']);
}
