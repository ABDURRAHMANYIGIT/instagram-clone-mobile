import 'package:flutter/material.dart';
import 'package:instagram_clone_mobile/resources/file_paths/icons.dart';

import '../../../data/enums/appbar_type_enum.dart';
import '../../../resources/styles/colors.dart';
import '../../../resources/styles/text_styles.dart';
import '../text/custom_text.dart';
import 'appbar_back_icon_widget.dart';
import 'appbar_trailing_icon_widget.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.appBarType,
    this.title,
    this.leadingIcon,
    this.trailingIcon,
    this.color,
    this.backgroundGradient,
    this.textColor,
    this.iconColor,
    this.leadingIconFunction,
    this.trailingIconFunction,
    this.toolbarHeight = kToolbarHeight,
    this.centerTitle = true,
  });
  final AppBarType appBarType;
  final String? title;
  final String? leadingIcon;
  final String? trailingIcon;
  final Color? color;
  final Gradient? backgroundGradient;
  final Color? textColor;
  final Color? iconColor;
  final Function? leadingIconFunction;
  final Function? trailingIconFunction;
  final double toolbarHeight;
  final bool? centerTitle;

  @override
  // ignore: library_private_types_in_public_api
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    switch (widget.appBarType) {
      case AppBarType.withLeading:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: widget.color ?? AppColors.primary,
          elevation: 0,
          leading: AppBarBackIconWidget(
            onTap: widget.leadingIconFunction,
            color: widget.iconColor ?? AppColors.light,
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: widget.backgroundGradient,
            ),
          ),
        );
      case AppBarType.withLeadingAndTitle:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: widget.color ?? AppColors.secondary,
          elevation: 0,
          leading: AppBarBackIconWidget(
            color: widget.iconColor ?? AppColors.light,
          ),
          centerTitle: widget.centerTitle,
          title: CustomText(
            widget.title ?? '',
            style: AppTextStyle.h4(
              color: widget.textColor ?? AppColors.light,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: widget.backgroundGradient,
            ),
          ),
        );
      case AppBarType.withTitle:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: widget.color ?? AppColors.primary,
          elevation: 0,
          centerTitle: widget.centerTitle,
          title: CustomText(
            widget.title ?? '',
            style: AppTextStyle.h3(
              weight: AppTextStyle.fontBold,
              color: AppColors.light,
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: widget.backgroundGradient,
            ),
          ),
        );
      case AppBarType.withLeadingTitleAndTrailing:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: widget.color ?? AppColors.primary,
          elevation: 0,
          leading: AppBarBackIconWidget(
            color: widget.iconColor ?? AppColors.light,
          ),
          title: Row(
            children: <Widget>[
              CustomText(
                widget.title ?? '',
                style: AppTextStyle.h4(
                  color: widget.textColor ?? AppColors.light,
                ),
              ),
              const Spacer(),
              AppBarTrailingIconWidget(
                color: widget.iconColor ?? AppColors.light,
                iconPath: widget.trailingIcon ?? AppIcons.close,
                onTap: widget.trailingIconFunction,
              ),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: widget.backgroundGradient,
            ),
          ),
        );
      case AppBarType.withTitleAndTrailing:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: widget.color ?? AppColors.primary,
          elevation: 0,
          title: Row(
            children: <Widget>[
              CustomText(
                widget.title ?? '',
                style: AppTextStyle.h4(
                  color: widget.textColor ?? AppColors.light,
                ),
              ),
              const Spacer(),
              AppBarTrailingIconWidget(
                color: widget.iconColor ?? AppColors.light,
                iconPath: widget.trailingIcon ?? AppIcons.close,
                onTap: widget.trailingIconFunction,
              ),
            ],
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: widget.backgroundGradient,
            ),
          ),
        );
    }
  }
}
