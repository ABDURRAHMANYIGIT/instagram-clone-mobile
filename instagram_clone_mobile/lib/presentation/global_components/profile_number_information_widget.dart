import 'package:flutter/cupertino.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class ProfileNumberInformation extends StatelessWidget {
  const ProfileNumberInformation(
      {super.key, required this.number, required this.title});
  final int number;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomText(
            number.toString(),
            style: AppTextStyle.bodyLarge(color: AppColors.black),
          ),
          CustomText(
            title,
            style: AppTextStyle.bodySmall(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
