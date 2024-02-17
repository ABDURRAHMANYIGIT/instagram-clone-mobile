import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';
import 'package:instagram_clone_mobile/resources/file_paths/icons.dart';

class AppBarBackIconWidget extends StatelessWidget {
  const AppBarBackIconWidget({super.key, this.onTap, required this.color});
  final Function? onTap;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () => onTap ?? Get.back(),
        child: ImageAsset(
          AppIcons.back,
          color: color,
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}
