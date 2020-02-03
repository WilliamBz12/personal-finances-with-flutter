import 'package:flutter/material.dart';
import 'package:personal_finances/app/shared/style/app_colors.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function onTap;
  final bool obscureText;
  final double width;
  final String title;

  final Widget prefixIcon;
  final Widget suffixIcon;
  final String message;

  CustomTextFieldWidget({
    this.hintText,
    this.keyboardType,
    @required this.controller,
    this.width,
    this.onTap,
    this.obscureText = false,
    this.message,
    this.prefixIcon,
    this.suffixIcon,
    this.title,
  });

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          widget.title != null
              ? Container(
                  child: Text(widget.title),
                  margin: EdgeInsets.only(bottom: 5),
                )
              : SizedBox(),
          TextField(
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            controller: widget.controller,
            onTap: widget.onTap,
            enableInteractiveSelection: false,
            style: _textStyle,
            readOnly: widget.onTap != null,
            decoration: InputDecoration(
              border: _inputBorder,
              hintText: widget.hintText,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              prefixIcon: widget.prefixIcon != null ? widget.prefixIcon : null,
              suffixIcon: widget.suffixIcon != null ? widget.suffixIcon : null,
              hintStyle: _textStyle.copyWith(color: Color(0xFFB4B7B8)),
            ),
          ),
        ],
      ),
    );
  }

  static final TextStyle _textStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );

  static final _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: AppColors.aluminum,
      width: 1,
    ),
  );
}
