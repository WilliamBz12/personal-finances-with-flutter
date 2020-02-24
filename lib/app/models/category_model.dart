import 'package:flutter/material.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class CategoryModel {
  String id;
  String title;
  bool isSpeend;
  IconData icon;
  Color color;

  CategoryModel({
    this.id,
    this.title,
    this.isSpeend = false,
    this.icon = Icons.devices_other,
    this.color = AppColors.primaryDarkColor,
  });
 
}
