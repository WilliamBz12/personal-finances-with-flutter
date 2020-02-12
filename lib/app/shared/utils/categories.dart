import 'package:flutter/material.dart';
import 'package:personal_finances/app/models/category_model.dart';

class Categories {
  static final List<CategoryModel> list = [
    CategoryModel(
      id: "food",
      title: "Alimentação",
      isSpeend: true,
      icon: Icons.wifi_tethering,
    ),
    CategoryModel(
      id: "transport",
      title: "Transporte",
      isSpeend: true,
      icon: Icons.card_membership,
    ),
    CategoryModel(
      id: "home",
      title: "Casa",
      isSpeend: true,
      icon: Icons.home,
    ),
    CategoryModel(
      id: "salary",
      title: "Salário",
      isSpeend: false,
      icon: Icons.attach_money,
    ),
  ];

  static CategoryModel categoryById({String id}) {
    return list.firstWhere((itemList) => itemList.id == id);
  }
}
