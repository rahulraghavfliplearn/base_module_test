import 'package:base_module/color.dart';
import 'package:base_module/hex_color.dart';
import 'package:base_module/student_avatar.dart';
import 'package:flutter/material.dart';

class GridCellPrime extends StatelessWidget {
  final String title;
  final String iconUrl;
  final double iconSize;
  final BuildContext context;
  final bool isLocalIcon;
  final String borderColor;
  final String bgColor;
  final Color titleColor;
  final double fontSize;
  final double iconTitleSpacing;

  const GridCellPrime(this.context,
      {@required this.title,
      this.iconUrl,
      @required this.iconSize,
      this.isLocalIcon = false,this.borderColor,this.bgColor,this.titleColor,this.fontSize,this.iconTitleSpacing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: bgColor != null ? HexColor(bgColor) : Colors.transparent,
            border: Border.all(color: borderColor != null ? HexColor(borderColor)  :  Colors.grey, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          isLocalIcon
              ? Image.network(
                  iconUrl,
                  fit: BoxFit.contain,
                  width: iconSize,
                  height: iconSize,
                )
              : StudentAvatar(
                  url: iconUrl != null ? iconUrl : "", iconSize: iconSize),
           SizedBox(
            height: iconTitleSpacing != null ? iconTitleSpacing : 20,
          ),
          Flexible(
              child: Text(title != null ? title : "",style: TextStyle(color: titleColor != null ? titleColor: AppColors.PRIMARY_THEME_COLOR,fontSize: fontSize != null? fontSize : 18),maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),),
        ]));
  }
}
