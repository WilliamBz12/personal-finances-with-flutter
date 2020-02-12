import 'package:flutter/material.dart';
import 'package:personal_finances/app/models/category_model.dart';

class CustomDropdown {
  static void show(
    BuildContext context, {
    @required Function(CategoryModel) onSelect,
    List<CategoryModel> items,
  }) {
    Size _screenSize = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Container(
            height: _screenSize.height * .35,
            padding: EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    onSelect(items[index]);
                    Navigator.pop(context);
                  },
                  leading: Icon(items[index].icon),
                  title: Text(
                    items[index].title,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  
                );
              },
            ),
          ),
        );
      },
    );
  }
}
