import 'package:flutter/material.dart';

class AnimatedSliderWidget extends StatefulWidget {
  final bool isListAnimationComplete;

  const AnimatedSliderWidget(
      {required this.isListAnimationComplete, super.key});

  @override
  State<AnimatedSliderWidget> createState() => _AnimatedSliderWidgetState();
}

class _AnimatedSliderWidgetState extends State<AnimatedSliderWidget> {
  bool animate = false;
  bool visibility = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isListAnimationComplete?true:false,
      child: Container(
        height: 45,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 400),
              left: animate ? 0 : -MediaQuery.of(context).size.width,
              right: animate
                  ? 0
                  : MediaQuery.of(context).size.width, // Added right position
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFd7c5b0),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          const Text(
                            "Gladkova St 12",
                            style: TextStyle(
                              color: Color(0xFF8c795d),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                height: 40,
                                width: 40,
                                margin: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xFFd7c5b0),
                                    size: 20,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
