import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:monie_point/presentation/modules/main_screen/main_screen.dart';


class BottomBarAnimatedWidget extends StatefulWidget {
  final Function(int index) onMenuItemSelect;
  final int visibilityAfter;
  final int animationStart;
  final int animationDuration;

  const BottomBarAnimatedWidget({
    required this.onMenuItemSelect,
    required this.animationDuration,
    required this.visibilityAfter,
    required this.animationStart,
    super.key,
  });

  @override
  _BottomBarAnimatedWidgetState createState() =>
      _BottomBarAnimatedWidgetState();
}

class _BottomBarAnimatedWidgetState extends State<BottomBarAnimatedWidget>{
  bool isVisible = false;
  bool animate = false;
  int selectedIndex = 2; // Initial selected index for the home icon

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

  void _onIconTap(int index) {
    widget.onMenuItemSelect(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: 200,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: widget.animationDuration),
              bottom: animate ? 0 : -300, // Change to slide up
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 100),
                    height: 60,
                    width: MediaQuery.sizeOf(context).width / 1.38,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1e1d22),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),

                        setBottomIcon(
                          0,
                          Icons.circle,
                        ),
                        Spacer(),
                        setBottomIcon(
                          1,
                          Icons.message,
                        ),
                        const Spacer(),
                        setBottomIcon(
                          2,
                          Icons.home_filled,
                        ),
                        const Spacer(),
                        setBottomIcon(
                          3,
                          Icons.favorite,
                        ),
                        const Spacer(),
                        setBottomIcon(
                          4,
                          Icons.person,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  StatelessWidget setBottomIcon(int index, IconData icon) {
    return selectedIndex == index
        ? Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xFFfca717)),
        child: Icon(
          icon,
          color: Colors.white,
        ))
        : GestureDetector(
      onTap: () => _onIconTap(index),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}