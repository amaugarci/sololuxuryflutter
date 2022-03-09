import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/app/app.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/network_dio/network_dio.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/store_info/local_store.dart';

LocalStore localStore = LocalStore();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  // await Firebase.initializeApp();
  NetworkDioHttp.setDynamicHeader(
    endPoint: AppConstants.apiEndPoint,
  );
  runApp(const SoloLuxuryApp());
}
