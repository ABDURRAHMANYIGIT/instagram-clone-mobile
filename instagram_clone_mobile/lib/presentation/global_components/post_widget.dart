import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.postObject});
  final PostObject postObject;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ImageAsset(postObject.image ?? ''),
        CustomText(
          postObject.description ?? '',
          textOverflow: TextOverflow.visible,
          style: AppTextStyle.h6(color: AppColors.black),
        ),
      ],
    );
  }
}
