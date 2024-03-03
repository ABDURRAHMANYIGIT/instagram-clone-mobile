import 'package:flutter/cupertino.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';

class SmallPostWidget extends StatelessWidget {
  const SmallPostWidget({super.key, required this.postObject});
  final PostObject postObject;
  @override
  Widget build(BuildContext context) {
    return ImageAsset(
      postObject.image ?? '',
      fit: BoxFit.cover,
    );
  }
}
