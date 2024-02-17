import 'package:flutter/material.dart';

import '../../../resources/styles/text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    super.key,
    this.textAlign = TextAlign.center,
    this.maxLines,
    this.textOverflow = TextOverflow.ellipsis,
    this.isItalic = false,
    this.style,
  });

  final String text;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final bool isItalic;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      style: style ?? AppTextStyle.bodyMedium(),
    );
  }
}
