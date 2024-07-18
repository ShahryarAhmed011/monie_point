import 'dart:async';

import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class AnimatedTextWidget extends StatefulWidget {
  const AnimatedTextWidget({super.key});

  @override
  _FadeInTextState createState() => _FadeInTextState();
}

class _FadeInTextState extends State<AnimatedTextWidget> {
  double _opacity = 0.0;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: Constants.nameVisibleTimeInMillis), () {
      setState(() {
        isVisible = true;
      });

      Timer(const Duration(milliseconds: Constants.nameTextAnimationTimeInMillis), () {
        setState(() {
          _opacity = 1.0;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: AnimatedOpacity(
        opacity: _opacity,
        duration: const Duration(milliseconds: Constants.nameTextAnimationTimeInMillis),
        child:  const Text(
          'Hi, Marina',
          style: TextStyle(
              color: Color(0xFFbfb29d),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        )
      ),
    );
  }
}
