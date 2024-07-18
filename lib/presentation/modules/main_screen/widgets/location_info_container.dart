import 'dart:async';

import 'package:flutter/material.dart';

import '../../../extensions/animation_time_extention.dart';
import '../../constant/constant.dart';

class LocationInfoContainer extends StatefulWidget {
  const LocationInfoContainer({super.key});

  @override
  _LocationInfoContainerState createState() => _LocationInfoContainerState();
}

class _LocationInfoContainerState extends State<LocationInfoContainer>
    with SingleTickerProviderStateMixin {
  bool _isRevealed = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double mHeight = AppBar().preferredSize.height - 10;
    double mWidth = MediaQuery.of(context).size.width * 0.45;
    Future.delayed(const Duration(milliseconds: 100), () {
      _controller.forward();
      setState(() {
        _isRevealed = true;
      });
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              height: mHeight,
              width: mWidth,
            ),
            FadeTransition(
                opacity: _controller.drive(CurveTween(curve: Curves.easeOut)),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                  width: _isRevealed ? mWidth : 0.0,
                  height: mHeight,
                  alignment: Alignment.centerLeft,
                  child: Container(
                      alignment: Alignment.center,
                      width: mWidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: locationText()),
                )),
          ],
        ),
      ],
    );
  }

  Widget locationText() {
    return  FadeInText();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}

class FadeInText extends StatefulWidget {
  @override
  _FadeInTextState createState() => _FadeInTextState();
}

class _FadeInTextState extends State<FadeInText> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Timer( const Duration(milliseconds: Constants.locationCardAnimationTimeInMillis), () {
      setState(() {
        _opacity = 1.0; // Fade in the text
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: Constants.locationCardAnimationTimeInMillis),
      child:  const Wrap(
        children: [
          Icon(
            Icons.pin_drop_rounded,
            color: Color(0xFFb4a78d),
            size: 20,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            'Saint Petersburg',
            style: TextStyle(
                color: Color(0xFFb4a78d),
                fontSize: 14,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
