import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle get titleTextStyle => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        fontFamily: 'Railway',
      );

  static TextStyle get descriptionTextStyle => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: 'Railway',
      );

  static TextStyle get bodyText => const TextStyle(
        fontFamily: 'Roboto',
        color: Colors.black87,
        fontSize: 16,
      );

  static TextStyle h1TextStyle({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return GoogleFonts.openSans(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 30,
        fontWeight: fontWeight ?? FontWeight.w700);
  }

  static TextStyle h4TextStyle({
    Color? color,
    FontWeight? fontWeight,
    double? fontSize,
  }) {
    return GoogleFonts.roboto(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.normal);
  }
}
