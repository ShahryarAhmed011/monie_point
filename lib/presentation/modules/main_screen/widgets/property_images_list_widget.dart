import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:show_up_animation/show_up_animation.dart';

import '../../constant/constant.dart';
import 'animated_slider_widget.dart';

class PropertyImagesListWidget extends StatefulWidget {
  final bool isListAnimationComplete;
  final Function() onAnimationComplete;


  const PropertyImagesListWidget(
      {required this.isListAnimationComplete,required this.onAnimationComplete(), super.key});

  @override
  State<PropertyImagesListWidget> createState() =>
      _PropertyImagesListWidgetState();
}

class _PropertyImagesListWidgetState extends State<PropertyImagesListWidget>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 9), () {
      widget.onAnimationComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowUpAnimation(
        animationDuration: const Duration(
            milliseconds:
                Constants.staggeredListSlideUpAnimationDurationTimeInMillis),
        curve: Curves.easeIn,
        direction: Direction.vertical,
        offset: 5,
        child:  StaggeredImagesListWidget(isListAnimationComplete: widget.isListAnimationComplete,));
  }
}

class StaggeredImagesListWidget extends StatelessWidget {

  final bool isListAnimationComplete;

  const StaggeredImagesListWidget({required this.isListAnimationComplete,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          top: 10,
        ),
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10, bottom: 2),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 2.5,
                  child: tileContainer(context)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: tileContainer(context)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.5,
                  child: tileContainer(context)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.5,
                  child: tileContainer(context)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 4,
                  mainAxisCellCount: 2.5,
                  child: tileContainer(context)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 3,
                  child: tileContainer(context)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.5,
                  child: tileContainer(context)),
              StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 1.5,
                  child: tileContainer(context)),
            ],
          ),
        ));
  }

  Widget tileContainer(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              "https://picsum.photos/id/1/200/300",
              fit: BoxFit.cover,
            ),
          ),
        ),
         Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSliderWidget(isListAnimationComplete:isListAnimationComplete,)),
      ],
    );
  }
}

