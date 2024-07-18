import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'count_up_animation_widget.dart';

class AnimatedContainerWidget extends StatefulWidget {
  final int animationStartsAt;
  final double containerHeight;
  final double containerWidth;
  final double circularRadius;
  final Color color;
  final String topText;
  final double countText;
  final String bottomText;
  final Color textColor;

  const AnimatedContainerWidget(
      {required this.countText,
      required this.topText,
      required this.bottomText,
      required this.textColor,
      required this.color,
      required this.circularRadius,
      required this.containerHeight,
      required this.containerWidth,
      required this.animationStartsAt,
      super.key});

  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: widget.animationStartsAt), () {
      setState(() {
        isVisible = true;
      });

      _controller.forward();
    });

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: MediaQuery.sizeOf(context).width * 0.45,
          width: MediaQuery.sizeOf(context).width * 0.45,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(widget.circularRadius),
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(widget.topText,
                      style: TextStyle(color: widget.textColor,fontSize: 14))),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CountUpWidget(
                          value: widget.countText,
                          textStyle:TextStyle(
                              color: widget.textColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold)
                      ),

                      Text(
                        widget.bottomText,
                        style: TextStyle(color: widget.textColor,fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

}

class CounterContainerWidget extends StatelessWidget {

  final int animationStartsAt;
  final double containerHeight;
  final double containerWidth;
  final double circularRadius;
  final Color color;
  final String topText;
  final double countText;
  final String bottomText;
  final Color textColor;

  const CounterContainerWidget(
      {required this.countText,
        required this.topText,
        required this.bottomText,
        required this.textColor,
        required this.color,
        required this.circularRadius,
        required this.containerHeight,
        required this.containerWidth,
        required this.animationStartsAt,
        super.key});



  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: MediaQuery.sizeOf(context).width * 0.45,
      width: MediaQuery.sizeOf(context).width * 0.45,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(circularRadius),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20,),
          Align(
              alignment: Alignment.topCenter,
              child: Text(topText,
                  style: TextStyle(color: textColor,fontSize: 14))),
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("${countText.toInt()}",
                      style:TextStyle(
                          color: textColor,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bottomText,
                    style: TextStyle(color:textColor,fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }
}



