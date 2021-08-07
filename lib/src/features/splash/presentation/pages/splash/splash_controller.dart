import 'dart:async';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:testeliteflower/src/core/routes/app_routes.dart';
import 'package:testeliteflower/src/core/usecases/usecase.dart';
import 'package:testeliteflower/src/core/utils/alerts.dart';
import 'package:testeliteflower/src/features/users/domain/usecases/get_language.dart';
import 'package:testeliteflower/src/features/users/domain/usecases/get_theme.dart';
import 'package:testeliteflower/src/features/users/domain/usecases/set_language.dart';

class SplashController extends GetxController {
  final GetTheme _getTheme;
  final GetLanguage _getLanguage;
  final SetLanguage _setLanguage;

  SplashController({
    required GetTheme getTheme,
    required GetLanguage getLanguage,
    required SetLanguage setLanguage,
  })  : _getTheme = getTheme,
        _getLanguage = getLanguage,
        _setLanguage = setLanguage;

  @override
  void onReady() async {
    super.onReady();

    final getThemeCall = await _getTheme(NoParams());
    getThemeCall.fold(Alerts.errorAlertUseCase, (r) {
      Get.changeThemeMode(r);
    });

    final getLanguageCall = await _getLanguage(NoParams());
    getLanguageCall.fold(Alerts.errorAlertUseCase, (r) async {
      Locale? locale = Get.deviceLocale;
      if (r != null) {
        locale = r;
      }

      if (locale == null) {
        locale = Locale("es");
      }

      final setLanguageCall = await _setLanguage(locale);
      setLanguageCall.fold(Alerts.errorAlertUseCase, (r) => null);
    });

    await Future.delayed(
      Duration(milliseconds: 800),
    );

    Get.offNamedUntil(AppRoutes.HOME, (route) => false);
  }
}
