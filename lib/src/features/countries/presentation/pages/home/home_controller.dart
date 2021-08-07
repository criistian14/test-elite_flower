import 'package:dartz/dartz.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/core/utils/alerts.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';
import 'package:testeliteflower/src/features/countries/domain/usecases/get_country.dart';
import 'package:testeliteflower/src/features/countries/domain/usecases/save_country.dart';
import 'package:testeliteflower/src/features/users/domain/usecases/set_language.dart';
import 'package:testeliteflower/src/features/users/domain/usecases/set_theme.dart';

class HomeController extends GetxController {
  final SetTheme _setTheme;
  final SetLanguage _setLanguage;
  final GetCountry _getCountry;
  final SaveCountry _saveCountry;

  bool loading = true;
  String countryCode = "col";
  CountryModel? country;

  HomeController({
    required SetTheme setTheme,
    required SetLanguage setLanguage,
    required GetCountry getCountry,
    required SaveCountry saveCountry,
  })  : _setTheme = setTheme,
        _setLanguage = setLanguage,
        _getCountry = getCountry,
        _saveCountry = saveCountry;

  @override
  void onInit() async {
    super.onInit();

    final getCountryCall = await _getCountry(countryCode);
    getCountryCall.fold(Alerts.errorAlertUseCase, (r) async {
      if (r == null) {
        return;
      }

      country = r as CountryModel?;
      loading = false;
      update();

      final saveCountryCall = await _saveCountry(r);
      saveCountryCall.fold(Alerts.errorAlertUseCase, (_) => null);
    });
  }

  void changeTheme() async {
    Either<Failure, void> result;

    if (Get.isDarkMode) {
      result = await _setTheme(ThemeMode.light);
    } else {
      result = await _setTheme(ThemeMode.dark);
    }

    result.fold(Alerts.errorAlertUseCase, (_) => null);
  }

  void changeLanguage() async {
    Locale? currentLocale = Get.locale;
    Locale newLocale;

    if (currentLocale == Locale("en")) {
      newLocale = Locale("es");
    } else {
      newLocale = Locale("en");
    }

    final setLanguageCall = await _setLanguage(newLocale);
    setLanguageCall.fold(Alerts.errorAlertUseCase, (r) => null);
  }

  // Getters
  String get populationFormatted {
    if (country == null) return "";

    MagicMask mask = MagicMask.buildMask("9?9?.9?9?9?.9?9?9?.9?9?9?");
    String formattedString = mask.getMaskedString(
      country!.population.toString(),
    );

    return formattedString;
  }
}
