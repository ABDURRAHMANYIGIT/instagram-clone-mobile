import 'package:flutter/cupertino.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';

class AppBarTrailingIconWidget extends StatelessWidget {
  const AppBarTrailingIconWidget(
      {super.key,
      required this.color,
      required this.iconPath,
      required this.onTap});
  final Color color;
  final String iconPath;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => onTap),
      child: ImageAsset(
        iconPath,
        color: color,
      ),
    );
  }
}
