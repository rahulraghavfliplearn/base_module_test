import 'package:flutter/material.dart';
import 'color.dart';

class FLSectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;

  final Color textColor;
  FLSectionTitle(this.title, {this.fontSize,this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: <Widget>[
          Container(color: AppColors.SECONDARY_THEME_COLOR_HEAVY,
            height: 15,
            width: 3,
      ),
      SizedBox(width: 5),
      Text(
        title,
        style: TextStyle(
          fontSize: fontSize != null ? fontSize  : 16.0,
          color: textColor,
          height: 1.3,
          fontFamily: "RobotoSlab",
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
    ]
    );
  }
}
