import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

// ignore: avoid_classes_with_only_static_members
class AppTextStyle {
/*fonts*/

/* Font Sizes*/

  static const double fontSizeHeading1 = 48.0;
  static const double fontSizeHeading2 = 40.0;
  static const double fontSizeHeading3 = 32.0;
  static const double fontSizeHeading4 = 24.0;
  static const double fontSizeHeading5 = 20.0;
  static const double fontSizeHeading6 = 18.0;
  static const double fontSizeBodyXLarge = 18.0;
  static const double fontSizeBodyLarge = 16.0;
  static const double fontSizeBodyMedium = 14.0;
  static const double fontSizeBodySmall = 12.0;
  static const double fontSizeBodyXSmall = 10.0;
/* Font Weights*/
  static const FontWeight fontLight = FontWeight.w300;
  static const FontWeight fontRegular = FontWeight.w400;
  static const FontWeight fontMedium = FontWeight.w500;
  static const FontWeight fontSemibold = FontWeight.w600;
  static const FontWeight fontBold = FontWeight.w700;
  static const FontWeight fontExtraBold = FontWeight.w800;

  static TextStyle h1({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeHeading1,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static TextStyle h2({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeHeading2,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static TextStyle h3({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeHeading3,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static TextStyle h4({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeHeading4,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }

  static TextStyle h5({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeHeading5,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }

  static TextStyle h6({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeHeading6,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }

  static TextStyle bodyXLarge({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeBodyXLarge,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }

  static TextStyle bodyLarge({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeBodyLarge,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }

  static TextStyle bodyMedium({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        overflow: overflow ?? TextOverflow.ellipsis,
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeBodyMedium,
        fontWeight: weight ?? fontBold,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }

  static TextStyle bodySmall({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeBodySmall,
        fontWeight: weight ?? fontMedium,
        overflow: overflow ?? TextOverflow.ellipsis,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }

  static TextStyle bodyXSmall({
    Color? color,
    double? size,
    FontWeight? weight,
    TextOverflow? overflow,
    FontStyle? isItalic,
    double? height,
    double? letterSpacing,
    bool isUnderline = false,
  }) {
    return GoogleFonts.roboto(
      textStyle: TextStyle(
        color: color ?? AppColors.light,
        fontSize: size ?? fontSizeBodyXSmall,
        fontWeight: weight ?? fontBold,
        overflow: overflow ?? TextOverflow.ellipsis,
        fontStyle: isItalic ?? FontStyle.normal,
        height: height,
        letterSpacing: letterSpacing,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
    );
  }
}
