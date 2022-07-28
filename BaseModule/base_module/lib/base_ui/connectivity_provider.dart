import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ConnectivityProvider with ChangeNotifier {
  bool _isOnline = true;

  bool get isOnline => _isOnline;

  ConnectivityProvider() {
    Connectivity _connectivity = Connectivity();
    _connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else if (event == ConnectivityResult.wifi) {
        try {
          final result = await InternetAddress.lookup('google.com');
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            print('resultOnline ${result[0]}');
            _isOnline = true;
            notifyListeners();
          } else {
            _isOnline = false;
            notifyListeners();
          }
        } on SocketException catch (_) {
          _isOnline = false;
          notifyListeners();
        }

      } else if (event == ConnectivityResult.mobile) {
        _isOnline = true;
        notifyListeners();
      } else {
        _isOnline = false;
        notifyListeners();
      }
    });
  }
}
