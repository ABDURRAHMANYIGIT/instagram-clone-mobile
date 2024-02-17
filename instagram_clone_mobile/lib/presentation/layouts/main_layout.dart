import 'package:flutter/material.dart';

import '../../resources/styles/colors.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    this.appBar,
    this.content,
    this.padding,
    this.alignment,
    this.backgroundColor,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.extendBodyBehindAppBar = false,
    this.bottomSheet,
    this.resizeToAvoidBottomInset,
  });
  final PreferredSizeWidget? appBar;
  final Widget? content;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final Widget? bottomSheet;

  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final bool extendBodyBehindAppBar;
  final bool? resizeToAvoidBottomInset;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      bottomSheet: bottomSheet,
      extendBody: true,
      backgroundColor: backgroundColor ?? AppColors.secondary,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      body: Container(
        alignment: alignment,
        padding: padding,
        child: content ?? Container(),
      ),
    );
  }
}
