import 'package:flutter/material.dart';
import 'package:base_module/color.dart';
import 'package:flutter/foundation.dart';

import 'base_ui/screen_type.dart';

class ActivityDetailRecommendationBanner extends StatelessWidget {

  var mediaQuery;
  final String title;
  Widget widgetStatus;
  bool beforeCloning;
  bool kIsWeb;
  ActivityDetailRecommendationBanner({this.title, this.widgetStatus, this.beforeCloning = false, this.kIsWeb = false });

  @override
  Widget build(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    double padding = mediaQuery.size.width * 0.07;

    return Container(
      height: beforeCloning ? mediaQuery.size.height * 0.19 : mediaQuery.size.height * 0.15,
      width: mediaQuery.size.width,
      decoration: BoxDecoration(color: AppColors.SECONDARY_THEME_COLOR),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mediaQuery.size.height * 0.037,
            //color: Colors.red,
            margin: EdgeInsets.fromLTRB(padding, ScreenType.isLargeScreen(context)? 15 :padding, 0, ScreenType.isLargeScreen(context)? 15 :padding * 0.5),
            child: Text(title,
                style: TextStyle(
                  color : AppColors.PRIMARY_THEME_COLOR,
                  fontSize: 20,
                  fontFamily: "RobotoSlab",
                ),
                //maxLines: 2,
                overflow: TextOverflow.ellipsis

            ),
          ),
          widgetStatus
        ],
      ),
    );
  }


}