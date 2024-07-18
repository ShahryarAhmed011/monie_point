
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class CustomContainer extends StatelessWidget {
  final String text;

  const CustomContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 160,
      child: locationText(),
      decoration: const BoxDecoration(
        color: Color(0xFFfca717),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomRight: Radius.circular(16),
            bottomLeft: Radius.circular(4)
        ),
      ),
    );
  }

  Widget locationText() {
    return  Text(text,style: TextStyle(color: Colors.white,fontSize: 12),);
  }


}
