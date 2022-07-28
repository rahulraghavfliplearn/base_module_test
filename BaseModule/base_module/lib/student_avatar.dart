import 'package:flutter/material.dart';
import 'package:base_module/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StudentAvatar extends StatelessWidget {
  var mediaQuery;
  static const NOT_FOUND = "0";

  final String url;
  final Color color;
  final double iconSize;

//  final bool kIsWeb;
  StudentAvatar({this.url, this.color, this.iconSize});

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    return getAvatarImage(context, url, color: color, iconSize: iconSize, kIsWeb: kIsWeb);
  }

  static double returnWebCordinate(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1300) {
      return 50;
    } else if (MediaQuery.of(context).size.width > 700) {
      return 50;
    } else {
      return 40;
    }
  }

  Widget getAvatarImage(BuildContext context, String url, {Color color, double iconSize, bool kIsWeb = false}) {
    double _width;
    double _height;

    if (kIsWeb) {
      _width = returnWebCordinate(context);
      _height = returnWebCordinate(context);
    } else {
      _width = MediaQuery.of(context).size.width * 0.12;
      _height = MediaQuery.of(context).size.width * 0.12;
    }

    return url != null && url.isNotEmpty && url != NOT_FOUND
        ? ClipOval(
            child: url.contains(".svg")
                ? SvgPicture.network(url,
                    placeholderBuilder: (BuildContext context) => Container(
                        width: iconSize != null ? iconSize : 50,
                        height: iconSize != null ? iconSize : 50,
                        decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.PRIMARY_THEME_COLOR, width: 1)),
                        child: Icon(Icons.description, size: iconSize != null ? iconSize : 40, color: AppColors.PRIMARY_THEME_COLOR)),
                    fit: BoxFit.cover,
                    width:iconSize != null ? iconSize : _width,
                    height: iconSize != null ? iconSize :_height
            )
                : Image.network(url, fit: BoxFit.cover, width: iconSize != null ? iconSize :  _width, height: iconSize !=null ? iconSize :  _height))
        : Icon(
            Icons.account_circle,
            size: iconSize != null ? iconSize :kIsWeb?30: MediaQuery.of(context).size.width * 0.12,
            color: color != null ? color : AppColors.TEACHER_NOT_EVALUATED,
          );
  }
}
