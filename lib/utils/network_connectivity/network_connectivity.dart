import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';

class NetworkConnectivity {
  final Connectivity _connectivity = Connectivity();

  Future<bool> initConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else
        return true;
      // ignore: unused_catch_clause
    } on PlatformException catch (e) {
      return false;
    }
  }
}
