import 'package:flutter/material.dart';

import '../main_screen/widgets/text_reveal_animation.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: const TextRevealAnimation(
              text: "Under development",
              visibilityAfter: 500,
              animationStart: 1000,
              animationDuration: 1000,
            ),
          ),
        ),
      ),
    );
  }
}
