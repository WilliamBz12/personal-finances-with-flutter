import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class AppTheme {
  static final light = ThemeData(
    textTheme: GoogleFonts.hindTextTheme(),
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.background,
    splashColor: AppColors.orange,
    accentColor: AppColors.primaryColor,
  );
}
