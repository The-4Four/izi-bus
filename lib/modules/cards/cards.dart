import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:izi_bus/modules/cards/components/editCard.dart';
import 'package:izi_bus/modules/cards/components/list_card.dart';
import 'package:izi_bus/modules/components/bottom_sheet/bottom_sheet.dart';
import 'package:izi_bus/modules/components/button/button.dart';
import 'package:izi_bus/modules/components/card.temp.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';
import 'package:izi_bus/shared/themes/app_text_styles.dart';

class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    Widget _buildCard(item) {
      return ListCard(
          id: item['id'], nameCard: item['name_card'], value: item['value']);
    }

    Widget getCards() {
      final Widget emptySvg =
          SvgPicture.asset('lib/assets/empty_card.svg', semanticsLabel: 'Izi');
      if (1 == 0) {
        return Column(children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, top: 24),
            child: emptySvg,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "Nenhum Cartão Cadastrado",
                    style: TextStyles.mediumBoldText)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text:
                        "Você não possui cartões cadastrados. Para cadastrar pressione CADASTRAR SEU CARTÃO",
                    style: TextStyles.smallText)),
          ),
        ]);
      } else {
        return Column(children: [
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => _buildCard(card[index]),
              separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                    color: AppColors.divider,
                  ),
              itemCount: card.length),
        ]);
      }
    }

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding:
              const EdgeInsets.only(top: 72, left: 24, right: 24, bottom: 40),
          child: Column(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: const Icon(Icons.arrow_back, size: 32),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 32),
                    child: RichText(
                        text: TextSpan(
                            text: "Seus Cartões", style: TextStyles.title)),
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<dynamic>(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16))),
                                builder: (context) {
                                  return const CustomBottomSheet(
                                      child: EditCard());
                                });
                          },
                          child: getCards(),
                        )
                      ]),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Button(
                    text: "Cadastrar Cartão",
                    onPressed: () {
                      Navigator.pushNamed(context, "/register_card");
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
