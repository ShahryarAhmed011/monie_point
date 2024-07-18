import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:monie_point/presentation/modules/main_screen/main_screen.dart';
import 'package:monie_point/presentation/modules/map_screen/widgets/custom_popup_menu_animated.dart';

class MapFunctionWidget extends StatefulWidget {
  final Function(int index) onMenuItemSelect;
  final int visibilityAfter;
  final int animationStart;
  final int animationDuration;

  const MapFunctionWidget({
    required this.onMenuItemSelect,
    required this.animationDuration,
    required this.visibilityAfter,
    required this.animationStart,
    super.key,
  });

  @override
  _MapFunctionWidgetState createState() =>
      _MapFunctionWidgetState();
}

class _MapFunctionWidgetState extends State<MapFunctionWidget>
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
            height: 300,
            width: MediaQuery.sizeOf(context).width / 1.18,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(100),
            ),

            child:  Container(
              margin: const EdgeInsets.only(bottom: 170,left: 10),
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,                      children: [
                    Column(
                      children: [
                        MyPopupMenu(
                          child: Container(
                            key: GlobalKey(),
                            padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                            decoration: BoxDecoration(
                                color: const Color(0xFF5E6062).withOpacity(0.7),
                                borderRadius: BorderRadius.circular(100)
                            ),
                            child: const Icon(Icons.wallet,color:  Colors.white,size: 22,),
                          ),
                        ),
                       /* GestureDetector(
                          onTap: (){
                          },
                          child:
                        ),*/
                        const SizedBox(height: 4,),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 14),
                          decoration: BoxDecoration(
                              color: const Color(0xFF5E6062).withOpacity(0.7),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: const Icon(Icons.send,color:  Colors.white,size: 22,),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 18),
                      decoration: BoxDecoration(
                          color: const Color(0xFF5E6062).withOpacity(0.7),
                          borderRadius: BorderRadius.circular(100)
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.format_list_bulleted,color:  Colors.white,size: 18,),
                          SizedBox(width: 6,),
                          Text("List of variants",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),),
                        ],
                      ),
                    )
                  ],
                  ),
                ],
              ),
            ),

        ),
      ),
    );


  }




}


