import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';

import 'currency_model.dart';
import 'language_model.dart';
import 'regional_bloc_model.dart';
import 'translations_model.dart';

part 'country_model.g.dart';

@HiveType(typeId: 0)
class CountryModel extends Country {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final List<String> topLevelDomain;

  @HiveField(2)
  final String? alpha2Code;

  @HiveField(3)
  final String? alpha3Code;

  @HiveField(4)
  final List<String>? callingCodes;

  @HiveField(5)
  final String? capital;

  @HiveField(6)
  final List<String>? altSpellings;

  @HiveField(7)
  final String? region;

  @HiveField(8)
  final String? subRegion;

  @HiveField(9)
  final int? population;

  @HiveField(10)
  final double lat;

  @HiveField(11)
  final double lng;

  @HiveField(12)
  final String? demonym;

  @HiveField(13)
  final double? area;

  @HiveField(14)
  final double? gini;

  @HiveField(15)
  final List<String> timezones;

  @HiveField(16)
  final List<String>? borders;

  @HiveField(17)
  final String nativeName;

  @HiveField(18)
  final String? numericCode;

  @HiveField(19)
  final List<CurrencyModel>? currencies;

  @HiveField(20)
  final List<LanguageModel>? languages;

  @HiveField(21)
  final TranslationsModel? translations;

  @HiveField(22)
  final String flag;

  @HiveField(23)
  final List<RegionalBlocModel>? regionalBlocs;

  @HiveField(24)
  final String? cioc;

  CountryModel({
    required this.name,
    required this.topLevelDomain,
    this.alpha2Code,
    this.alpha3Code,
    this.callingCodes,
    this.capital,
    this.altSpellings,
    this.region,
    this.subRegion,
    this.population,
    required this.lat,
    required this.lng,
    this.demonym,
    this.area,
    this.gini,
    required this.timezones,
    this.borders,
    required this.nativeName,
    this.numericCode,
    this.currencies,
    this.languages,
    this.translations,
    required this.flag,
    this.regionalBlocs,
    this.cioc,
  }) : super(
          name: name,
          topLevelDomain: topLevelDomain,
          alpha2Code: alpha2Code,
          alpha3Code: alpha3Code,
          callingCodes: callingCodes,
          capital: capital,
          altSpellings: altSpellings,
          region: region,
          subRegion: subRegion,
          population: population,
          lat: lat,
          lng: lng,
          demonym: demonym,
          area: area,
          gini: gini,
          timezones: timezones,
          borders: borders,
          nativeName: nativeName,
          numericCode: numericCode,
          currencies: currencies,
          languages: languages,
          translations: translations,
          flag: flag,
          regionalBlocs: regionalBlocs,
          cioc: cioc,
        );

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        name: json["name"],
        topLevelDomain: List<String>.from(json["topLevelDomain"].map((x) => x)),
        alpha2Code: json["alpha2Code"],
        alpha3Code: json["alpha3Code"],
        callingCodes: List<String>.from(json["callingCodes"].map((x) => x)),
        capital: json["capital"],
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: json["region"],
        subRegion: json["subregion"],
        population: json["population"],
        lat: double.parse(json["latlng"][0].toString()),
        lng: double.parse(json["latlng"][1].toString()),
        demonym: json["demonym"],
        area: double.parse(json["area"].toString()),
        gini: json["gini"].toDouble(),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        borders: List<String>.from(json["borders"].map((x) => x)),
        nativeName: json["nativeName"],
        numericCode: json["numericCode"],
        currencies: List<CurrencyModel>.from(
          json["currencies"].map((x) => CurrencyModel.fromJson(x)),
        ),
        languages: List<LanguageModel>.from(
          json["languages"].map((x) => LanguageModel.fromJson(x)),
        ),
        translations: TranslationsModel.fromJson(json["translations"]),
        flag: json["flag"],
        regionalBlocs: List<RegionalBlocModel>.from(
          json["regionalBlocs"].map((x) => RegionalBlocModel.fromJson(x)),
        ),
        cioc: json["cioc"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "topLevelDomain": List<dynamic>.from(topLevelDomain.map((x) => x)),
        "alpha2Code": alpha2Code,
        "alpha3Code": alpha3Code,
        "callingCodes": (callingCodes != null)
            ? List<dynamic>.from(callingCodes!.map((x) => x))
            : null,
        "capital": capital,
        "altSpellings": (altSpellings != null)
            ? List<dynamic>.from(altSpellings!.map((x) => x))
            : null,
        "region": region,
        "subregion": subRegion,
        "population": population,
        "latlng": [lat, lng],
        "demonym": demonym,
        "area": area,
        "gini": gini,
        "timezones": List<dynamic>.from(timezones.map((x) => x)),
        "borders": (borders != null)
            ? List<dynamic>.from(borders!.map((x) => x))
            : null,
        "nativeName": nativeName,
        "numericCode": numericCode,
        "currencies": (currencies != null)
            ? List<dynamic>.from(currencies!.map((x) => x.toJson()))
            : null,
        "languages": (languages != null)
            ? List<dynamic>.from(languages!.map((x) => x.toJson()))
            : null,
        "translations": (translations != null) ? translations!.toJson() : null,
        "flag": flag,
        "regionalBlocs": (regionalBlocs != null)
            ? List<dynamic>.from(regionalBlocs!.map((x) => x.toJson()))
            : null,
        "cioc": cioc,
      };
}
