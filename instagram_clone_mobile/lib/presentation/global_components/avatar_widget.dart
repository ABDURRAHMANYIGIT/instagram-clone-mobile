import 'package:flutter/material.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.width = 32,
    this.height = 32,
    required this.imagePath,
    this.isBlured = false,
  });
  final double width;
  final double height;
  final String imagePath;
  final bool isBlured;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(360),
        child: ImageAsset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
