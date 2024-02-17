import 'package:flutter/material.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';

class InProgressWidget extends StatelessWidget {
  const InProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator.adaptive(
      backgroundColor: AppColors.light,
    );
  }
}
