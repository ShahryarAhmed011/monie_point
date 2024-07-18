import 'package:flutter/material.dart';

class TextRevealAnimation extends StatefulWidget {
  final String text;
  final int visibilityAfter;
  final int animationStart;
  final int animationDuration;

  const TextRevealAnimation(
      {required this.animationDuration,
      required this.text,
      required this.visibilityAfter,
      required this.animationStart,
      super.key});

  @override
  _TextRevealAnimationState createState() => _TextRevealAnimationState();
}

class _TextRevealAnimationState extends State<TextRevealAnimation>
    with SingleTickerProviderStateMixin {
  bool isVisible = false;
  bool animate = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: widget.visibilityAfter), () {
      setState(() {
        isVisible = true;
      });
      Future.delayed(Duration(milliseconds: widget.animationStart), () {
        setState(() {
          animate = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SizedBox(
        height: 40,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDuration),
              bottom: animate ? 0 : -50, // Change to slide up
              child: Text(
                widget.text,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
