import 'package:flutter/material.dart';

import 'animated_container_widget.dart';
import 'property_images_list_widget.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  bool isListAnimationComplete = false;
  bool isExpandable = false;
  late ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    double initialOffset = MediaQuery.of(context).size.height * 0.23;
    _controller = ScrollController(initialScrollOffset: initialOffset);
    return Column(
      children: [
        (!isListAnimationComplete)
            ? Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    counterContainerAnimated(context),
                    PropertyImagesListWidget(
                      isListAnimationComplete: isListAnimationComplete,
                      onAnimationComplete: () {
                        setState(() {
                          isListAnimationComplete = true;
                        });
                      },
                    ),
                  ],
                ),
              )
            : Expanded(
                flex: 1,
                child: NestedScrollView(
                    controller: _controller,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          expandedHeight:
                              MediaQuery.sizeOf(context).height * 0.23,
                          floating: true,
                          pinned: true,
                          forceElevated: true,
                          backgroundColor: Colors.transparent,
                          flexibleSpace: FlexibleSpaceBar(
                            background: counterContainerSimple(context),
                          ),
                        ),
                      ];
                    },
                    body:  StaggeredImagesListWidget(isListAnimationComplete: isListAnimationComplete,)),
              )
      ],
    );
  }

  Container counterContainerAnimated(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: EdgeInsets.only(right: 14, left: 14),
      height: MediaQuery.sizeOf(context).height * 0.23,
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainerWidget(
            animationStartsAt: 4,
            containerHeight: MediaQuery.sizeOf(context).width * 0.45,
            containerWidth: MediaQuery.sizeOf(context).width * 0.45,
            circularRadius: 100,
            color: const Color(0xFFfca717),
            topText: "Buy",
            bottomText: "Offers",
            countText: 1034,
            textColor: Colors.white,
          ),
          AnimatedContainerWidget(
            animationStartsAt: 4,
            containerHeight: MediaQuery.sizeOf(context).width * 0.45,
            containerWidth: MediaQuery.sizeOf(context).width * 0.45,
            circularRadius: 10,
            color: Colors.white,
            topText: "Rent",
            bottomText: "Offers",
            countText: 2191,
            textColor: const Color(0xFFb09a75),
          ),
        ],
      ),
    );
  }

  Container counterContainerSimple(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      padding: EdgeInsets.only(right: 14, left: 14),
      height: MediaQuery.sizeOf(context).height * 0.23,
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CounterContainerWidget(
            animationStartsAt: 4,
            containerHeight: MediaQuery.sizeOf(context).width * 0.45,
            containerWidth: MediaQuery.sizeOf(context).width * 0.45,
            circularRadius: 100,
            color: const Color(0xFFfca717),
            topText: "Buy",
            bottomText: "Offers",
            countText: 1034,
            textColor: Colors.white,
          ),
          CounterContainerWidget(
            animationStartsAt: 4,
            containerHeight: MediaQuery.sizeOf(context).width * 0.45,
            containerWidth: MediaQuery.sizeOf(context).width * 0.45,
            circularRadius: 10,
            color: Colors.white,
            topText: "Rent",
            bottomText: "Offers",
            countText: 2191,
            textColor: const Color(0xFFb09a75),
          ),
        ],
      ),
    );
  }
}
