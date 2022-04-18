import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/app/app.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/network_dio/network_dio.dart';
import 'package:solo_luxury/utils/store_info/local_store.dart';

import 'app/services/notification_service.dart';

LocalStore localStore = LocalStore();


//Call Android Module
const platform = MethodChannel('flutter.native/helper');


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initMessaging();
  backgroundNotification();
  await GetStorage.init();
  // await Firebase.initializeApp();
  NetworkDioHttp.setDynamicHeader(
    endPoint: AppConstants.apiEndPoint,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    await runZonedGuarded(() async {
      await Firebase.initializeApp();
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      runApp(const SoloLuxuryApp());
    }, (error, stackTrace) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    });
  });
}
