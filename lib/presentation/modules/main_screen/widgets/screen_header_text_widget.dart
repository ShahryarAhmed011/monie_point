import 'package:flutter/material.dart';

import '../../constant/constant.dart';
import 'text_reveal_animation.dart';

class ScreenHeaderTextWidget extends StatelessWidget {
  const ScreenHeaderTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextRevealAnimation(
          text: "let's select your",
          visibilityAfter: Constants.screenHeaderText1VisibleTimeInMillis,
          animationStart: Constants.screenHeaderTextStartAndDurationTimeInMillis,
          animationDuration: Constants.screenHeaderTextStartAndDurationTimeInMillis,
        ),
        TextRevealAnimation(
          text: "perfect place",
          visibilityAfter: Constants.screenHeaderText2VisibleTimeInMillis,
          animationStart: Constants.screenHeaderTextStartAndDurationTimeInMillis,
          animationDuration: Constants.screenHeaderTextStartAndDurationTimeInMillis,
        ),
      ],
    );
  }
}
