import 'package:flutter/material.dart';

import '../../../resources/styles/colors.dart';
import '../in_progress_widget.dart';

//* This is the main button component. Other buttons depend on this button.
class CustomButton extends StatelessWidget {
  const CustomButton({
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
    this.border,
    this.elevation = 0,
    this.isDisabled = false,
    this.isCircle = false,
    this.isSingleLayer = false,
    this.disabledColor = AppColors.tertiary,
    this.inProgress = false,
    this.style,
    this.inProgressColor = AppColors.secondary,
    this.disabledOverride = false,
    this.childFlex = 2,
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
  final BoxBorder? border;
  final double? elevation;
  final bool isDisabled;
  final bool isCircle;
  final bool isSingleLayer;
  final Color? disabledColor;
  final bool inProgress;
  final ButtonStyle? style;
  final Color inProgressColor;
  final bool disabledOverride;
  final int childFlex;
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
            ? (isDisabled ? disabledColor : color ?? AppColors.yellow)
            : isDisabled
                ? disabledColor
                : null,
        border: border,
      ),
      child: ElevatedButton(
        onPressed: () {
          if (isDisabled && !disabledOverride) {
            return;
          }
          if (inProgress == false) {
            return onTap?.call();
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius!)
                : BorderRadius.circular(0),
          ),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: padding,
        ),
        child: Row(
          mainAxisAlignment: inProgress
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: <Widget>[
            if (inProgress)
              const SizedBox(
                width: 16,
                height: 16,
              ),
            Flexible(
              flex: childFlex,
              child: child,
            ),
            if (inProgress)
              Flexible(
                child: SizedBox(
                  width: 16,
                  height: 16,
                  child: inProgress
                      ? const InProgressWidget()
                      : const SizedBox(
                          width: 16,
                          height: 16,
                        ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
