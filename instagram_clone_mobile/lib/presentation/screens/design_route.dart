import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/enums/appbar_type_enum.dart';
import 'package:instagram_clone_mobile/domain/router/router.dart';
import 'package:instagram_clone_mobile/presentation/global_components/appbar/custom_appbar.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';

class DesignRoute extends StatelessWidget {
  const DesignRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          appBarType: AppBarType.withLeadingAndTitle, title: 'Design Route'),
      body: Container(
        color: AppColors.light,
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: ListView(
          children: [
            ...AppRouter.pages.map((e) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                      onPressed: () => Get.toNamed(e.name),
                      child: Text(e.name)),
                ))
          ],
        ),
      ),
    );
  }
}
