import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:solo_luxury/utils/app_pages.dart';
import 'package:solo_luxury/utils/lang_directory/translation_service.dart';

class SoloLuxuryApp extends StatefulWidget {
  const SoloLuxuryApp({Key? key}) : super(key: key);

  @override
  _SoloLuxuryAppState createState() => _SoloLuxuryAppState();
}

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "navigator");

class _SoloLuxuryAppState extends State<SoloLuxuryApp> {
  static final dataStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'Solo Luxury',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: primaryWhite,
          scaffoldBackgroundColor: primaryWhite,
          fontFamily: 'SofiaPro',
          hintColor: regularGrey,
          iconTheme: const IconThemeData(
            color: regularGrey,
            size: 24,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 1,
            // ignore: deprecated_member_use
            textTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
            backgroundColor: primaryWhite,
            foregroundColor: titleBlack,
            centerTitle: true,
          ),
        ),
        getPages: AppPages.routes,
        locale: TranslationService.locale,
        fallbackLocale: TranslationService.fallbackLocale,
        translations: TranslationService(),
      ),
    );
  }
}
