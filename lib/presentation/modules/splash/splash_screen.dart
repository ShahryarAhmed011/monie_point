import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monie_point/presentation/extensions/context_extensions.dart';

import '../../base/screen/stateful_screen.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatefulScreen<SplashBloc> {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }

}

class _SplashScreenState extends ScreenState<SplashBloc>
    with TickerProviderStateMixin {

  @override
  Widget buildScreen(BuildContext context) {
    context.read<SplashBloc>().add(SplashScreenInit());
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.appColorScheme.backgroundColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 55.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TypewriterAnimatedText("Monie Point",speed: const Duration(milliseconds: 300),textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ],
              ),
            )
        )
    );
  }
}

