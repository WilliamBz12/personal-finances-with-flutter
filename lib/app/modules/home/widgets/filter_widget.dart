import 'package:flutter/material.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final list = [
    'Todos',
    'Entradas',
    'Saídas',
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        list.length,
        (index) => _buildItem(text: list[index]),
      ),
    );
  }

  Widget _buildItem({String text, bool isActived = false}) {
    return FlatButton(
      onPressed: isActived ? () {} : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        
      ),
      disabledColor: AppColors.lightGrey,
      color: Colors.white,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF173A61),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
