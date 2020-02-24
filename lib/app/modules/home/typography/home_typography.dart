import 'package:flutter/material.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class HomeTypography {
  static const subTitleHead = TextStyle(
    fontSize: 12,
    color: AppColors.lightGrey,
  );

  static const titleHead = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w900,
    fontSize: 28,
  );

  static descriptionItem({bool speend}) {
    return TextStyle(
      fontSize: 12,
      color: speend ? Color(0xFF637F9E) : AppColors.green,
    );
  }

  static titleItem({Color color}) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: color,
    );
  }

  static const filterText = TextStyle(
    fontSize: 14,
    color: AppColors.primaryDarkColor,
    fontWeight: FontWeight.w600,
  );
}
