import 'package:flutter/material.dart';
import 'package:base_module/reusable_widgets.dart';

class ScreenState {
  static Widget empty(String title, String error, BuildContext context) {
    return Scaffold(
        appBar: ReusableWidgets.getAppBarWithCallback(title, () {
          Navigator.pop(context);
        }),
        body: Center(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Text(error,
                  style: new TextStyle(color: Color(0xff734497), fontSize: 18))
            ])));
  }

  static Widget loading(String title, BuildContext context,
      {bool showNavBar = true}) {
    return Scaffold(
        appBar: showNavBar
            ? ReusableWidgets.getAppBarWithCallback(title, () {
                Navigator.pop(context);
              })
            : null,
        body: Center(
            child: Container(
                margin: EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ))));
  }

  static Widget entryPointLoading(String title, BuildContext context) {
    return Scaffold(
        // appBar: ReusableWidgets.getAppBar(title,context),
        body: Center(
            child: Container(
                margin: EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ))));
  }

  static Widget webEntryPointLoading(String title, BuildContext context,
      {bool showNavBar = false}) {
    return Scaffold(
        appBar: showNavBar ? ReusableWidgets.getAppBar(title, context) : null,
        body: Center(
            child: Container(
                margin: EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator()],
                ))));
  }

  static Widget emptyModalScreen(
      String title, String error, BuildContext context) {
    return Center(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Text(error,
              style: new TextStyle(color: Color(0xff734497), fontSize: 18))
        ]));
  }

  static Widget loadingModalScreen(String title, BuildContext context) {
    return Center(
        child: Container(
            margin: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [CircularProgressIndicator()],
            )));
  }
}
