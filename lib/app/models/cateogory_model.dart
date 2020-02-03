import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  bool isSpeend;
  IconData icon;

  CategoryModel({
    this.id,
    this.title,
    this.isSpeend = false,
    this.icon = Icons.devices_other,
  });
}
