import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

final customFont = GoogleFonts.inter();

class AppTextStyle {
  static TextTheme textTheme = ThemeData.light().textTheme.apply(fontFamily: customFont.fontFamily);
}
