import 'dart:io';

import 'package:base_module/base_ui/screen_type.dart';
import 'package:base_module/color.dart';
import 'package:base_module/web_view_updated.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import 'WebViewUtils.dart';

class ReusableWidgets {
  // String _selectedItem;
  // String value;
  static getAppBar(String title, BuildContext context) {
    if (kIsWeb) {
      return AppBar(
        title: Text(title, style: TextStyle(fontFamily: "RobotoSlab")),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return AppBar(
        title: Text(title, style: TextStyle(fontFamily: "RobotoSlab")),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          disabledColor: Colors.white,
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return AppBar(
        title: Text(title, style: TextStyle(fontFamily: "RobotoSlab")),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          disabledColor: Colors.white,
          onPressed: () {
//            Navigator.of(context).pop(true);
            pop(animated: true);
            //SystemNavigator.pop();
            //SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
            // exit(0);
//            Navigator.pop();
//            Navigator.of(context).pop();
          },
        ),
      );
    } else {
      return AppBar(
        title: Text(title, style: TextStyle(fontFamily: "RobotoSlab")),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
      );
    }
  }

  static getAppBarWithCallback(String title, VoidCallback callback,
      {VoidCallback homeCallback, dynamic iconName = Icons.home_work}) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AppBar(
        title: Text(title),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          homeCallback != null && !kIsWeb
              ? IconButton(
                  icon: Icon(
                    iconName,
                    color: Colors.white,
                  ),
                  onPressed: homeCallback,
                )
              : SizedBox(
                  height: 0,
                  width: 0,
                )
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            disabledColor: Colors.white,
            onPressed: callback),
      );
    } else {
      return AppBar(
        title: Text(title),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          homeCallback != null && !kIsWeb
              ? IconButton(
                  icon: Icon(
                    iconName,
                    color: Colors.white,
                  ),
                  onPressed: homeCallback,
                )
              : SizedBox(
                  height: 0,
                  width: 0,
                )
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            disabledColor: Colors.white,
            onPressed: callback),
      );
    }
  }

  static getAppBarWithCallbackAndRightAction(String title,
      VoidCallback callback, String rightTitle, VoidCallback rightAction) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AppBar(
        title: Text(title),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            disabledColor: Colors.white,
            onPressed: callback),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              rightAction();
            },
            child: Text("Edit"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );
    } else {
      return AppBar(
        title: Text(title),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            disabledColor: Colors.white,
            onPressed: callback),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              rightAction();
            },
            child: Text("Edit"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      );
    }
  }

  //Print Toast
  printToast(String errorMsg) {
    Fluttertoast.showToast(
        msg: errorMsg.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey[500],
        textColor: Colors.white,
        fontSize: 14.0);
  }

  //Launching url in browser
  launchUrlInBrowser(String url) async {
    if (url != null && url.length > 0) {
      try {
        await launch(url);
      } catch (e) {
        printToast("Could not launch $url");
      }
    }
  }

  launchUrlInWebView(String url, String title, BuildContext context,
      {bool showNavigation = false,
      bool showRefresh = true,
      Function(String) callback}) {
    if (kIsWeb) {
      launchUrlInBrowser(url);
    } else {
      return Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return WebViewUpdated(
              url: url,
              title: title,
              showNavigation: showNavigation,
              showRefresh: showRefresh,
              callBack: callback);
        }),
      );
    }
  }

  launchUrlInNewWebView(String url, String title, BuildContext context) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return WebViewUpdated(url: url, title: title);
      }),
    );
  }

  static Future<void> pop({bool animated}) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemNavigator.pop();
    } else {
      await SystemChannels.platform
          .invokeMethod<void>('SystemNavigator.pop', animated);
    }
  }

  static double returnWebCordinate(BuildContext context) {
    if (MediaQuery.of(context).size.width > 1300) {
      return 90;
    } else if (MediaQuery.of(context).size.width > 700) {
      return 60;
    } else {
      return 40;
    }
  }

  Widget studentAvatar(BuildContext context, String url,
      {Color color, double iconSize}) {
    if (kIsWeb) {
      return url != null && url.isNotEmpty
          ? ClipOval(
              child: Image.network(url,
                  fit: BoxFit.cover,
                  width: returnWebCordinate(context),
                  height: returnWebCordinate(context)))
          : Icon(
              Icons.account_circle,
              size: returnWebCordinate(context),
              color: color != null ? color : AppColors.TEACHER_NOT_EVALUATED,
            );
    } else {
      return url != null && url.isNotEmpty
          ? ClipOval(
              child: url.contains(".svg")
                  ? SvgPicture.network(url,
                      placeholderBuilder: (BuildContext context) => Container(
                          width: iconSize != null ? iconSize : 50,
                          height: iconSize != null ? iconSize : 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.PRIMARY_THEME_COLOR,
                                  width: 1)),
                          child: Icon(Icons.description,
                              size: 40, color: AppColors.PRIMARY_THEME_COLOR)),
                      color: AppColors.PRIMARY_THEME_COLOR,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.width * 0.12)
                  : Image.network(url,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.12,
                      height: MediaQuery.of(context).size.width * 0.12))
          : Icon(
              Icons.account_circle,
              size: iconSize != null
                  ? iconSize
                  : MediaQuery.of(context).size.width * 0.12,
              color: color != null ? color : AppColors.TEACHER_NOT_EVALUATED,
            );
    }
  }

  static double returnWebWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.9;
  }

  static BoxConstraints constraints(BuildContext context) {
    return ScreenType.isLargeScreen(context)
        ? BoxConstraints(maxWidth: returnWebWidth(context))
        : BoxConstraints();
  }

  Future<void> selectDateComponent(
      {BuildContext context,
      DateTime initialDateTime,
      Function(DateTime) callback}) async {
    final DateTime pickedDate = await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: initialDateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
      confirmText: "Set",
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light().copyWith(
              primary: AppColors.PRIMARY_THEME_COLOR,
            ),
          ),
          child: child,
        );
      },
    );
    if (pickedDate != null) {
      callback.call(pickedDate);
    }
  }

  showSnackBar(
      {int durationInSeconds,
      @required String message,
      @required BuildContext context,
      Color textColor,
      double fontSize,
      TextAlign textAlign}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration:
          Duration(seconds: durationInSeconds != null ? durationInSeconds : 2),
      content: Text(
        message,
        textAlign: textAlign != null ? textAlign : TextAlign.left,
        style: TextStyle(
            color: textColor != null ? textColor : null,
            fontSize: fontSize != null ? fontSize : 14),
      ),
    ));
  }
}
