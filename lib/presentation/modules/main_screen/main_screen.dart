import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:monie_point/presentation/modules/main_screen/widgets/animated_text_widget.dart';
import 'package:monie_point/presentation/modules/main_screen/widgets/home_body_widget.dart';
import 'package:monie_point/presentation/modules/main_screen/widgets/location_info_container.dart';
import 'package:monie_point/presentation/modules/main_screen/widgets/profile_image_widget.dart';
import 'package:monie_point/presentation/modules/main_screen/widgets/screen_header_text_widget.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFf9f7f3),
        title: const LocationInfoContainer(),
        actions: const [ProfileImageWidget()],
      ),
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFfcddbb),
              Color(0xFFfcddbb),
              Color(0xFFfcddbb),
              Color(0xFFfcddbb),
              Color(0xFFf8f8f8),
              Color(0xFFf8f8f8),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child:  const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [

              Padding(
                padding: EdgeInsets.only(top: 40, right: 14, left: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedTextWidget(),
                    SizedBox(
                      height: 6,
                    ),
                    ScreenHeaderTextWidget()
                  ],
                ),
              ),
              Expanded(flex: 1, child: HomeBodyWidget())
            ]),
      ),
    );
  }

}



