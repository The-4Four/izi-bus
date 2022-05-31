import 'package:flutter/material.dart';
import 'package:izi_bus/shared/themes/app_colors.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget child;

  const CustomBottomSheet({Key? key, required this.child}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
      child: Column(
        children: [bottomSheetLine(context), widget.child],
      ),
    );
  }

  Widget bottomSheetLine(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.2,
      child: Container(
        margin: const EdgeInsets.only(top: 16, bottom: 32),
        child: Container(
          height: 2.0,
          decoration: const BoxDecoration(
            color: AppColors.bottomSheetHandle,
            borderRadius: BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}
