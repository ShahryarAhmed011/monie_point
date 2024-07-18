import 'package:flutter/material.dart';

import '../../constant/constant.dart';


class ProfileImageWidget extends StatefulWidget {
  const ProfileImageWidget({super.key});

  @override
  _ProfileImageWidgetState createState() => _ProfileImageWidgetState();
}

class _ProfileImageWidgetState extends State<ProfileImageWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: Constants.profileImageAnimationTimeInMillis),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          margin: const EdgeInsets.only(right: 12),
          duration: const Duration(milliseconds: Constants.profileImageAnimationTimeInMillis),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
          ),
          child: SizedBox(
            width: AppBar().preferredSize.height - 10,
            height: AppBar().preferredSize.height - 10,
            child: ClipOval( // Clip the image to a circular shape
              child: Image.asset("assets/images/jpg/avatar.jpg",scale: 1,fit: BoxFit.cover,),
            ),
          ),
        ),
      ),
    );
  }
}
