import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/styles/animation_values.dart';

import '../../../resources/file_paths/icons.dart';
import '../../../resources/styles/colors.dart';
import '../../../resources/styles/text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.label = '',
    this.labelTextStyle,
    this.inputTextStyle,
    required this.controller,
    this.labelWeight = FontWeight.bold,
    this.isPassword = false,
    this.isCommentPhoto = false,
    this.onTapaddPhoto,
    this.onEditingComplete,
    this.maxLines = 1,
    this.fontSize,
    this.onChanged,
    this.onSubmitted,
    this.isReadOnly = false,
    this.textInputType,
    this.validator,
    this.initData,
    this.inputAction,
    this.maxLength,
    this.showMaxLength = false,
    this.focusNode,
    this.contentPadding = const EdgeInsets.all(8),
    this.hintText,
    this.isSearching = false,
    this.isPhoneNumber = false,
    this.borderColor,
    this.borderWidth = 0,
    this.autoFocus = false,
    this.enabledBorder,
    this.focusedBorder,
    this.prefixIconPath,
    this.labelSuffixWidget,
    this.isEnabled = true,
    this.inputFormatters,
    this.textCapitalization,
    this.textAlign = TextAlign.start,
  });
  final String label;
  final TextStyle? labelTextStyle;
  final TextStyle? inputTextStyle;
  final FontWeight? labelWeight;
  final TextEditingController controller;
  final bool isPassword;
  final bool isCommentPhoto;
  final VoidCallback? onTapaddPhoto;
  final int? maxLines;
  final bool isReadOnly;
  final String? initData;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final void Function()? onEditingComplete;
  final double? fontSize;
  final TextInputAction? inputAction;
  final int? maxLength;
  final bool showMaxLength;
  final FocusNode? focusNode;
  final EdgeInsets? contentPadding;
  final String? hintText;
  final bool isSearching;
  final bool isPhoneNumber;
  final Color? borderColor;
  final double borderWidth;
  final bool autoFocus;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final String? prefixIconPath;
  final Widget? labelSuffixWidget;
  final bool isEnabled;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization? textCapitalization;

  final TextAlign textAlign;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            CustomText(
              widget.label,
              style: widget.labelTextStyle ??
                  AppTextStyle.bodyMedium(
                    color: AppColors.black,
                    weight: AppTextStyle.fontSemibold,
                  ),
            ),
            widget.labelSuffixWidget ?? const SizedBox.shrink()
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: widget.isPassword && !showPassword,
          textAlign: widget.textAlign,
          textCapitalization:
              widget.textCapitalization ?? TextCapitalization.none,
          enabled: widget.isEnabled,
          autofocus: widget.autoFocus,
          validator: widget.validator ?? (String? val) => null,
          controller: widget.controller,
          cursorColor: AppColors.black,
          maxLines: widget.maxLines,
          cursorHeight: 20,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onSubmitted,
          textInputAction: widget.inputAction,
          focusNode: widget.focusNode,
          style: widget.inputTextStyle ??
              AppTextStyle.bodyMedium(
                size: 13,
                color: AppColors.black,
              ),
          keyboardType: widget.textInputType,
          readOnly: widget.isReadOnly,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            counterText: widget.showMaxLength ? null : '',
            fillColor:
                widget.isReadOnly ? AppColors.lightGrey : AppColors.light,
            filled: true,
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24,
              minWidth: 24,
            ),
            contentPadding: widget.contentPadding,
            prefixIcon: widget.prefixIconPath != null
                ? _PrefixconWidget(widget.prefixIconPath!)
                : widget.isSearching
                    ? const _SearchIconWidget()
                    : widget.isPassword
                        ? const _PasswordIconWidget()
                        : widget.isPhoneNumber
                            ? const _PhoneCodeWidget()
                            : null,
            suffixIcon: widget.isPassword
                ? _ShowPasswordIconWidget(
                    showPassword: showPassword,
                    onTap: () {
                      setState(
                        () {
                          showPassword = !showPassword;
                        },
                      );
                    },
                  )
                : null,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.grey,
              ),
            ),
            hintText: widget.hintText,
            hintStyle: AppTextStyle.bodyMedium(
              color: widget.isReadOnly ? AppColors.lightGrey : AppColors.grey,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: widget.enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? AppColors.grey,
                    // width: 1,
                  ),
                ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: widget.borderColor ?? AppColors.lightGrey,
                // width: 1,
              ),
            ),
            focusedBorder: widget.focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: widget.borderColor ?? AppColors.grey,
                  ),
                ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.red,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ShowPasswordIconWidget extends StatefulWidget {
  const _ShowPasswordIconWidget({required this.showPassword, this.onTap});
  final bool showPassword;
  final Function? onTap;
  @override
  State<_ShowPasswordIconWidget> createState() =>
      _ShowPasswordIconWidgetState();
}

class _ShowPasswordIconWidgetState extends State<_ShowPasswordIconWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: AnimatedCrossFade(
          crossFadeState: widget.showPassword
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: AnimationValues.shortDuration,
          firstChild: const ImageAsset(
            AppIcons.close,
            color: AppColors.grey,
          ),
          secondChild: const ImageAsset(
            AppIcons.close,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}

class _PrefixconWidget extends StatelessWidget {
  const _PrefixconWidget(this.iconPath);
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        10,
        12,
        10,
      ),
      child: ImageAsset(
        iconPath,
        color: AppColors.grey,
      ),
    );
  }
}

class _SearchIconWidget extends StatelessWidget {
  const _SearchIconWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: ImageAsset(
        AppIcons.close,
        height: 10,
        width: 10,
      ),
    );
  }
}

class _PasswordIconWidget extends StatelessWidget {
  const _PasswordIconWidget();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        10,
        12,
        10,
      ),
      child: ImageAsset(
        AppIcons.close,
        color: AppColors.lightGrey,
      ),
    );
  }
}

class _PhoneCodeWidget extends StatelessWidget {
  const _PhoneCodeWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 5, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ImageAsset(
            AppIcons.close,
            height: 10,
            width: 10,
          ),
          const SizedBox(
            width: 8,
          ),
          CustomText(
            '+90',
            style: AppTextStyle.bodyMedium(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
