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
    this.color = AppColors.turquoise,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      width: MediaQuery.of(context).size.height,
      height: 60,
      child: RaisedButton(
        disabledColor: AppColors.grey,
        child: !isLoading 
          ? Text(
              text,
              style: TextStyle(color: Colors.white),
            )
          : CircularProgressIndicator(),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        elevation: 0,
        onPressed: !isLoading ? onTap : null,
      ),
    );
  }
}