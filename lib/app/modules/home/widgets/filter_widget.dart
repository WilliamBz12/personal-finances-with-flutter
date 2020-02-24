import 'package:flutter/material.dart';
import 'package:personal_finances/app/modules/home/typography/home_typography.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class FilterWidget extends StatefulWidget {
  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String selected = 'Todos';

  final _options = [
    'Todos',
    'Entradas',
    'Saídas',
  ];

  void _onTap(String text) {
    setState(() => selected = text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        _options.length,
        (index) => _buildItem(text: _options[index]),
      ),
    );
  }

  Widget _buildItem({String text, bool isActived = false}) {
    return Container(
      margin: EdgeInsets.only(right: 15),
      child: RaisedButton(
        onPressed: selected != text ? () => _onTap(text) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        disabledColor: AppColors.darkGrey,
        color: Colors.white,
        child: Text(
          text,
          style: HomeTypography.filterText,
        ),
      ),
    );
  }
}
