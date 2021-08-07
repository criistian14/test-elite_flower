import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'src/constants_app.dart';
import 'src/core/routes/app_pages.dart';
import 'src/core/theme/dark/dark_theme.dart';
import 'src/core/theme/light/app_theme.dart';
import 'src/core/translations/app_translations.dart';
import 'src/features/splash/presentation/pages/splash/splash_binding.dart';
import 'src/features/splash/presentation/pages/splash/splash_page.dart';
import 'src/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
        title: 'Test Elite Flower - Christian',
        debugShowCheckedModeBanner: ConstantsApp.ENVIRONMENT == Environment.Dev,
        theme: appTheme,
        darkTheme: darkTheme,
        builder: (BuildContext context, Widget? widget) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget ?? Container(),
          );
        },
        getPages: AppPages.pages,
        defaultTransition: Transition.cupertino,
        popGesture: true,
        translations: AppTranslations(),
        home: SplashPage(),
        initialBinding: SplashBinding(),
      ),
    );
  }
}
