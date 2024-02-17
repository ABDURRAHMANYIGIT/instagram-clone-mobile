// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageAsset extends StatelessWidget {
  const ImageAsset(
    this.visualPath, {
    super.key,
    this.fit = BoxFit.contain,
    this.color,
    this.width,
    this.height,
  });
  final String visualPath;
  final BoxFit fit;
  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (visualPath.isWeb) {
      return visualPath.isSvg
          ? SvgPicture.network(
              visualPath,
              fit: fit,
              color: color,
              width: width,
              height: height,
            )
          : Image.network(
              visualPath,
              fit: fit,
              width: width,
              height: height,
            );
    } else {
      // Offline
      return visualPath.isSvg
          ? SvgPicture.asset(
              visualPath,
              fit: fit,
              color: color,
              width: width,
              height: height,
            )
          : Image.asset(
              visualPath,
              fit: fit,
              width: width,
              height: height,
            );
    }
  }
}

extension ImageType on String {
  bool get isSvg {
    return contains('.svg');
  }

  bool get isWeb {
    return contains('http');
  }
}
