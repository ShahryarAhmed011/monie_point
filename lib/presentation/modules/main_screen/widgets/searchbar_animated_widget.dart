import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:monie_point/presentation/modules/main_screen/main_screen.dart';

class SearchBarAnimatedWidget extends StatefulWidget {
  final Function(int index) onMenuItemSelect;
  final int visibilityAfter;
  final int animationStart;
  final int animationDuration;

  const SearchBarAnimatedWidget({
    required this.onMenuItemSelect,
    required this.animationDuration,
    required this.visibilityAfter,
    required this.animationStart,
    super.key,
  });

  @override
  _SearchBarAnimatedWidgetState createState() =>
      _SearchBarAnimatedWidgetState();
}

class _SearchBarAnimatedWidgetState extends State<SearchBarAnimatedWidget>
    with SingleTickerProviderStateMixin {
  bool isVisible = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: widget.visibilityAfter), () {
      setState(() {
        isVisible = true;
      });
      _controller.forward();
    });

    _controller = AnimationController(
      duration:  Duration(milliseconds: widget.animationDuration),
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
          duration:  Duration(milliseconds: widget.animationDuration),
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 60),
          height: 48,
          width: MediaQuery.sizeOf(context).width / 1.2,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(100),
          ),

          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height:45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: Icon(Icons.search,color:  Color(0xFFb09a75),size: 24,),
                      ),
                      Expanded(flex:1,child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Saint Petersburg',
                          border: InputBorder.none,
                        ),
                        style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                      )
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(Icons.menu,color: const Color(0xFFb09a75),size: 20,),
              )

            ],
          )
        ),
      ),
    );
  }

}
