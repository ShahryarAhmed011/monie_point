import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:monie_point/presentation/modules/account_screen/account_screen.dart';
import 'package:monie_point/presentation/modules/chat_screen/chat_screen.dart';
import 'package:monie_point/presentation/modules/fav_screen/fav_screen.dart';
import 'package:monie_point/presentation/modules/home/widgets/bottombar_animated_widget.dart';
import 'package:monie_point/presentation/modules/main_screen/main_screen.dart';
import 'package:monie_point/presentation/modules/map_screen/map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _selectedScreen =  MainScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _selectedScreen,
          Align(
              alignment: Alignment.bottomCenter,
              child: BottomBarAnimatedWidget(
                animationDuration: 1000,
                visibilityAfter: 8000,
                animationStart: 1000,
                onMenuItemSelect: (menuIndex) {
                  if(menuIndex == 0){
                    _navigateTo( MapScreen());
                  }else if(menuIndex == 1){
                    _navigateTo(const ChatScreen());
                  }else if(menuIndex == 2){
                    _navigateTo(const MainScreen());
                  }else if(menuIndex == 3){
                    _navigateTo(const FavScreen());
                  }else if(menuIndex == 4){
                    _navigateTo(const AccountScreen());
                  }


                  },
              ))
        ],
      ),
    );
  }

  void _navigateTo(Widget screen) {
    setState(() {
      _selectedScreen = screen;
    });
  }
}
