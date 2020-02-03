import 'package:flutter/material.dart';

class HandleDateModal {
  static Future showPlatformDatePicker(
    BuildContext context, {
    @required Function(DateTime) onSelect,
  }) async {
    DateTime _dateNow = DateTime.now();

    DateTime selected = await showDatePicker(
      context: context,
      initialDate: _dateNow,
      firstDate: _dateNow.subtract(Duration(days: 3000)),
      lastDate: _dateNow.add(Duration(days: 3000)),
    );

    if (selected != null) {
      onSelect(selected);
    }
  }
}
