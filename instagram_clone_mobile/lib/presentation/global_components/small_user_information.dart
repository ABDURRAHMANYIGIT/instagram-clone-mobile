import 'package:flutter/widgets.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/presentation/global_components/avatar_widget.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class SmallUserInformation extends StatelessWidget {
  const SmallUserInformation({super.key, required this.userObject});
  final UserObject userObject;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AvatarWidget(
          imagePath: userObject.profilePhoto ?? '',
          width: 52,
          height: 52,
        ),
        const SizedBox(
          width: 20,
        ),
        CustomText(
          userObject.name ?? '',
          style: AppTextStyle.h6(color: AppColors.background),
        )
      ],
    );
  }
}
