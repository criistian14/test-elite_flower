import 'package:equatable/equatable.dart';

import 'currency.dart';
import 'language.dart';
import 'regional_bloc.dart';
import 'translations.dart';

class Country extends Equatable {
  final String name;
  final List<String> topLevelDomain;
  final String? alpha2Code;
  final String? alpha3Code;
  final List<String>? callingCodes;
  final String? capital;
  final List<String>? altSpellings;
  final String? region;
  final String? subRegion;
  final int? population;
  final double lat;
  final double lng;
  final String? demonym;
  final double? area;
  final double? gini;
  final List<String> timezones;
  final List<String>? borders;
  final String nativeName;
  final String? numericCode;
  final List<Currency>? currencies;
  final List<Language>? languages;
  final Translations? translations;
  final String flag;
  final List<RegionalBloc>? regionalBlocs;
  final String? cioc;

  Country({
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
  });

  @override
  List get props => [
        name,
        topLevelDomain,
        alpha2Code,
        alpha3Code,
        callingCodes,
        capital,
        altSpellings,
        region,
        subRegion,
        population,
        lat,
        lng,
        demonym,
        area,
        gini,
        timezones,
        borders,
        nativeName,
        numericCode,
        currencies,
        languages,
        translations,
        flag,
        regionalBlocs,
        cioc,
      ];
}
