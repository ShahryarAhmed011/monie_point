
import 'dart:io';

import 'package:flutter/material.dart';

enum ImageSourceType{
  network, asset, file
}

class AvatarWidget extends StatelessWidget {
  final String imageSource;
  final double size;
  final bool showBorder;
  final ImageSourceType imageSourceType;

  const AvatarWidget({
    Key? key,
    required this.imageSource,
    this.size = 50.0,
    this.showBorder = true,
    required this.imageSourceType,
  }) : super(key: key);

  getImageProvider(){
    switch(imageSourceType){
      case ImageSourceType.network:
        return NetworkImage(imageSource);
      case ImageSourceType.asset:
        return AssetImage(imageSource);
      case ImageSourceType.file:
        return FileImage(File(imageSource));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image(
          image: getImageProvider(),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Icon(Icons.person, size: size * 0.8);
          },
        ),
      ),
    );
  }
}
