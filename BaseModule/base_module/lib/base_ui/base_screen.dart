import 'package:base_module/base_ui/base_constants.dart';
import 'package:base_module/base_ui/base_interface.dart';
import 'package:base_module/color.dart';
import 'package:base_module/reusable_widgets.dart';
import 'package:base_module/screen_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'connectivity_provider.dart';

abstract class BaseScreen extends StatefulWidget {
  BaseScreen({Key key}) : super(key: key);
}

abstract class BaseScreenState<T extends BaseScreen> extends State<T>
    implements BaseInterface {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      counter++;
    });
  }

  Widget loading(String title, BuildContext context, {bool showNavBar = true}) {
    return ScreenState.loading(title, context, showNavBar: showNavBar);
  }

  Widget loadingWebEntryPoint(String title, BuildContext context,
      {bool showNavBar = true}) {
    return ScreenState.webEntryPointLoading(title, context,
        showNavBar: showNavBar);
  }

  Widget loadingEntryPoint(String title) {
    return ScreenState.entryPointLoading(title, context);
  }

  getAppBar(String title, BuildContext context) {
    return ReusableWidgets.getAppBar(title, context);
  }

  Widget buildEmptyWidget(BuildContext context, String screenName,
      {String message, bool showNavBar = true}) {
    return Scaffold(
      appBar: showNavBar ? getAppBarWithCallback(screenName) : null,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            constraints: kIsWeb
                ? BoxConstraints(
                    maxWidth: ReusableWidgets.returnWebWidth(context))
                : BoxConstraints(),
            width: double.infinity,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  BaseConstants.ImageSourcePath + "empty_learner.png",
                  width: 100,
                  height: 100,
                ),
                Text(
                    message != null && message.isNotEmpty
                        ? message
                        : "No Classes Available",
                    style:
                        new TextStyle(color: Color(0xff734497), fontSize: 18)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ],
            )),
          ),
        ),
      ),
    );
  }

  void homeCallBack() {
    Navigator.popUntil(context, ModalRoute.withName('landing_page_main'));
  }

  void backButtonCallBack() {
    Navigator.pop(context);
  }

  getAppBarWithCallback(String title, {bool showHomeButton = false}) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AppBar(
        title: Text(title),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          showHomeButton && !kIsWeb
              ? IconButton(
                  icon: Icon(
                    Icons.home_work,
                    color: Colors.white,
                  ),
                  onPressed: homeCallBack,
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
            onPressed: backButtonCallBack),
      );
    } else {
      return AppBar(
        title: Text(title),
        backgroundColor: AppColors.PRIMARY_THEME_COLOR,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          showHomeButton && !kIsWeb
              ? IconButton(
                  icon: Icon(
                    Icons.home_work,
                    color: Colors.white,
                  ),
                  onPressed: homeCallBack,
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
            onPressed: backButtonCallBack),
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

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget buildBaseWidget(BuildContext context, Widget widget) {
    final isOnline = Provider.of<ConnectivityProvider>(context).isOnline;
    if (!isOnline) {
      ReusableWidgets().printToast("No Internet Connection");
    }
    return widget;
  }

  @override
  void initState() {
    super.initState();
    tapToRefresh();
  }

  Widget buildNoInternetWidget(BuildContext context, String screenName,
      {String message}) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            constraints: kIsWeb
                ? BoxConstraints(
                    maxWidth: ReusableWidgets.returnWebWidth(context))
                : BoxConstraints(),
            width: double.infinity,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  BaseConstants.ImageSourcePath + "empty_learner.png",
                  width: 100,
                  height: 100,
                ),
                Text(
                    message != null && message.isNotEmpty
                        ? message
                        : "No Internet Available",
                    style: new TextStyle(
                        color: AppColors.PRIMARY_THEME_COLOR, fontSize: 18)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                GestureDetector(
                  onTap: () {
                    tapToRefresh();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Text(
                            message != null && message.isNotEmpty
                                ? message
                                : "Tap to retry.",
                            style: new TextStyle(fontSize: 22)),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }

  // tapToRefresh()
  // {
  //   ReusableWidgets().printToast("Trying to refresh");
  // }

  Future<void> pop({bool animated}) async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      SystemNavigator.pop();
    } else {
      await SystemChannels.platform
          .invokeMethod<void>('SystemNavigator.pop', animated);
    }
  }
}
