import 'package:flutter/material.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isLoading;
  final Color color;

  CustomButtonWidget({
    @required this.text,
    @required this.onTap,
    this.color = AppColors.primaryColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.height,
      height: 60,
      child: RaisedButton(
        disabledColor: AppColors.aluminumDark,
        child: !isLoading
            ? Text(
                text,
                style: TextStyle(color: Colors.white),
              )
            : CircularProgressIndicator(),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onPressed: !isLoading ? onTap : null,
      ),
    );
  }
}