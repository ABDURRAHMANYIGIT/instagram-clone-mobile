import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/styles/colors.dart';

//* This is the main button component. Other buttons depend on this button.
class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton({
    super.key,
    this.onTap,
    required this.child,
    this.width = 250,
    this.gradient,
    this.fontSize,
    this.color,
    this.height = 47,
    this.padding,
    this.borderRadius = 16,
    required this.buttonName,
    this.border,
    this.elevation = 0,
    this.isDisabled = false,
    this.isCircle = false,
    this.isSingleLayer = false,
    this.disabledColor = AppColors.grey,
    this.style,
  });

  final VoidCallback? onTap;
  final Widget child;
  final LinearGradient? gradient;
  final Color?
      color; //* Either color or gradient should be null. If they aren't null, gradient will be ignored. // if you want to have a transparent background, give Colors.transparent
  final double? fontSize;
  final double? width;
  final double height;
  final EdgeInsets? padding;
  final double? borderRadius;
  final String buttonName;
  final BoxBorder? border;
  final double? elevation;
  final bool isDisabled;
  final bool isCircle;
  final bool isSingleLayer;
  final Color? disabledColor;

  final ButtonStyle? style;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: borderRadius != null
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.circular(0),
          color: gradient == null
              ? (color ?? Get.theme.primaryColor.withOpacity(0.5))
              : null,
          border: border),
      child: ElevatedButton(
        onPressed: () {
          return onTap?.call();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius!)
                : BorderRadius.circular(0),
          ),
          backgroundColor: AppColors.transparent,
          shadowColor: AppColors.transparent,
          padding: padding,
        ),
        child: child,
      ),
    );
  }
}
