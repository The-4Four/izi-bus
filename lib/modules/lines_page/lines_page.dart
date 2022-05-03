import 'package:flutter/material.dart';
import 'package:izi_bus/modules/components/line_card.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/modules/components/lines_temp.dart';
import 'package:izi_bus/modules/home/home.dart';

class LinesPage extends StatelessWidget {
  const LinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Column(children: [
          GestureDetector(
            onTap: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()))
            },
            child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: AppColors.background,
                ),
                width: 40,
                height: 40,
                child: const Icon(Icons.arrow_back,
                    size: 32, color: AppColors.textPrimary)),
          ),
          Expanded(
            child: ListView.separated(
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
          )
        ]));
  }
}

Widget _buildLineCard(item) {
  return LineCard(
      code: item['code'],
      description: item['description'],
      schedules: item['schedules']);
}
