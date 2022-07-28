/*
import 'package:flutter/material.dart';
import 'package:base_module/reusable_widgets.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewUtils extends StatelessWidget {
  final String url;
  final String title;

  WebViewUtils({@required this.url, @required this.title});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
              url: url,
              appBar: ReusableWidgets.getAppBarWithCallback(title, () {
                Navigator.pop(context);
              }),
            ),
      },
    );
  }
}
*/
