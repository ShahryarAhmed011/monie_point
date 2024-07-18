import 'package:flutter/material.dart';
import 'package:monie_point/presentation/modules/constant/constant.dart';

class CountUpWidget extends StatelessWidget {
  final double value;
  final TextStyle textStyle;

  const CountUpWidget(
      {super.key, required this.value, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: value),
      duration: const Duration(
          milliseconds: Constants.countUpAnimationDurationTimeInMillis),
      builder: (context, value, child) {
        return Text(
          value.toInt().toString(),
          style: textStyle,
        );
      },
    );
  }
}

