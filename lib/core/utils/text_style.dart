import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insights_news/core/utils/colors.dart';

TextStyle getTitleSytle(context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontSize: fontSize ?? 20,
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodySytle(
  context, {
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontSize: fontSize ?? 16,
    color: color ?? Theme.of(context).colorScheme.onSurface,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getSmallSytle(
  context, {
  double? fontSize,
  Color? color,
  FontWeight? fontWeight,
}) {
  return TextStyle(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    fontSize: fontSize ?? 12,
    color: color ?? ProjectColors.primaryColor,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
