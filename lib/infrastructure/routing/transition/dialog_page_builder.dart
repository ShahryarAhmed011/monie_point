import 'package:flutter/material.dart';

class DialogPageBuilder<T> extends Page<T> {
  final Widget child;

  const DialogPageBuilder({required this.child, super.key});

  @override
  Route<T> createRoute(BuildContext context) => RawDialogRoute<T>(
    settings: this,
    pageBuilder: (context, animation, secondaryAnimation) {
      return child;
    },
    barrierDismissible:false,
    barrierColor: Colors.black.withOpacity(0.5),
  );
}