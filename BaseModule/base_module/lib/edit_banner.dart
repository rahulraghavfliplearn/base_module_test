library edit_banner;

import 'package:base_module/flclickable_text.dart';
import 'package:flutter/material.dart';
import 'color.dart';

class EditBanner {
  VoidCallback callbackEditBanner;

  Widget render(BuildContext context, List<String> title, String clickableText, VoidCallback callback) {
    String bannerText = "";
    title.asMap().forEach((index, value) {
      if (index == title.length - 1) {
        bannerText = bannerText + "$value";
      } else {
        bannerText = bannerText + "$value | ";
      }
    });
    callbackEditBanner = callback;

    return Container(
      height: MediaQuery.of(context).size.height* 0.05,
      decoration: BoxDecoration(
        color: AppColors.SECONDARY_THEME_COLOR_LIGHT,
        border: Border.all(color: AppColors.SECONDARY_THEME_COLOR_HEAVY),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 30.0),
        child: Row(

            children: <Widget>[
              Expanded(
                flex: 3,
                child: Text(
                  bannerText,
                  maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: 12.0,
                fontFamily: "RobotoSlab",
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
            ),
          ),
              ),
          Spacer(),
              FLClickableText(text:clickableText,
                callback:_cbUnderlineText,
                isUnderLined: true,
                fontSize: 14,)

            ]
        ),
      ),
    );
  }

  VoidCallback _cbUnderlineText() {
    print("BaseModule Edit Banner:Underline Text CLicked");
    callbackEditBanner();
  }
}
