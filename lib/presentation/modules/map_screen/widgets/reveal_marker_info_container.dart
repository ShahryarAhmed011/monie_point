import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monie_point/presentation/modules/map_screen/widgets/custom_marker.dart';

class RevealMarkerInfoContainer extends StatefulWidget {
  final String locationString;

  const RevealMarkerInfoContainer({required this.locationString,super.key});

  @override
  _RevealMarkerInfoContainerState createState() => _RevealMarkerInfoContainerState();
}

class _RevealMarkerInfoContainerState extends State<RevealMarkerInfoContainer>
    with SingleTickerProviderStateMixin {
  bool _isRevealed = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    double mHeight = 45;
    double mWidth = 140;
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
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              width: _isRevealed ? mWidth : 0.0,
              height: mHeight,
              alignment: Alignment.centerLeft,
              child: CustomContainer(text: widget.locationString,),
            )
          ],
        ),
      ],
    );

  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}
