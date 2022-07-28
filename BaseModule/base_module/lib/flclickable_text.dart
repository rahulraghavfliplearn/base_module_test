import 'package:flutter/material.dart';
import 'package:base_module/color.dart';

class FLClickableText extends StatelessWidget {
  final String text;
  final VoidCallback callback;
  final bool isUnderLined;
  final double fontSize;


  FLClickableText({ @required this.text,
  @required this.callback,
  this.isUnderLined = false,
    this.fontSize = 10,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.PRIMARY_THEME_COLOR,
          fontSize: fontSize,
          fontFamily: "RobotoSlab",
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          decoration: isUnderLined == true
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
      ),
    );
  }

}