import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';
import 'package:testeliteflower/src/features/countries/data/models/currency_model.dart';
import 'package:testeliteflower/src/features/countries/data/models/language_model.dart';
import 'package:testeliteflower/src/features/countries/data/models/regional_bloc_model.dart';
import 'package:testeliteflower/src/features/countries/data/models/translations_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCountryModel = CountryModel(
    name: "Colombia",
    topLevelDomain: [".co"],
    alpha2Code: "CO",
    alpha3Code: "COL",
    callingCodes: ["57"],
    capital: "Bogotá",
    altSpellings: ["CO", "Republic of Colombia", "República de Colombia"],
    region: "Americas",
    subRegion: "South America",
    population: 48759958,
    lat: 4,
    lng: -72,
    demonym: "Colombian",
    area: 1141748,
    gini: 55.9,
    timezones: ["UTC-05:00"],
    borders: ["BRA", "ECU", "PAN", "PER", "VEN"],
    nativeName: "Colombia",
    numericCode: "170",
    currencies: [
      CurrencyModel(
        code: "COP",
        name: "Colombian peso",
        symbol: "\$",
      ),
    ],
    languages: [
      LanguageModel(
        iso6391: "es",
        iso6392: "spa",
        name: "Spanish",
        nativeName: "Español",
      ),
    ],
    translations: TranslationsModel(
      de: "Kolumbien",
      es: "Colombia",
      fr: "Colombie",
      ja: "コロンビア",
      it: "Colombia",
      br: "Colômbia",
      pt: "Colômbia",
      nl: "Colombia",
      hr: "Kolumbija",
      fa: "کلمبیا",
    ),
    flag: "https://restcountries.eu/data/col.svg",
    regionalBlocs: [
      RegionalBlocModel(
        acronym: "PA",
        name: "Pacific Alliance",
        otherAcronyms: [],
        otherNames: ["Alianza del Pacífico"],
      ),
      RegionalBlocModel(
        acronym: "USAN",
        name: "Union of South American Nations",
        otherAcronyms: ["UNASUR", "UNASUL", "UZAN"],
        otherNames: [
          "Unión de Naciones Suramericanas",
          "União de Nações Sul-Americanas",
          "Unie van Zuid-Amerikaanse Naties",
          "South American Union"
        ],
      ),
    ],
    cioc: "COL",
  );

  test(
    "should be a subclass of Country entity",
    () async {
      // assert
      expect(tCountryModel, isA<Country>());
    },
  );

  group("fromJson", () {
    test(
      "should return a valid model when the JSON has title and state",
      () async {
        // arrange
        final Map<String, dynamic> jsonMap = jsonDecode(
          fixture("country_col.json"),
        );

        // act
        final result = CountryModel.fromJson(jsonMap);

        // assert
        expect(result, isA<Country>());
        expect(result, tCountryModel);
      },
    );
  });

  group("toJson", () {
    test(
      "should return a JSON map containing the proper data",
      () async {
        // arrange
        final result = tCountryModel.toJson();

        // assert
        final expectedMap = {
          "name": "Colombia",
          "topLevelDomain": [".co"],
          "alpha2Code": "CO",
          "alpha3Code": "COL",
          "callingCodes": ["57"],
          "capital": "Bogotá",
          "altSpellings": [
            "CO",
            "Republic of Colombia",
            "República de Colombia"
          ],
          "region": "Americas",
          "subregion": "South America",
          "population": 48759958,
          "latlng": [4, -72],
          "demonym": "Colombian",
          "area": 1141748,
          "gini": 55.9,
          "timezones": ["UTC-05:00"],
          "borders": ["BRA", "ECU", "PAN", "PER", "VEN"],
          "nativeName": "Colombia",
          "numericCode": "170",
          "currencies": [
            {
              "code": "COP",
              "name": "Colombian peso",
              "symbol": "\$",
            }
          ],
          "languages": [
            {
              "iso639_1": "es",
              "iso639_2": "spa",
              "name": "Spanish",
              "nativeName": "Español"
            }
          ],
          "translations": {
            "de": "Kolumbien",
            "es": "Colombia",
            "fr": "Colombie",
            "ja": "コロンビア",
            "it": "Colombia",
            "br": "Colômbia",
            "pt": "Colômbia",
            "nl": "Colombia",
            "hr": "Kolumbija",
            "fa": "کلمبیا"
          },
          "flag": "https://restcountries.eu/data/col.svg",
          "regionalBlocs": [
            {
              "acronym": "PA",
              "name": "Pacific Alliance",
              "otherAcronyms": [],
              "otherNames": ["Alianza del Pacífico"]
            },
            {
              "acronym": "USAN",
              "name": "Union of South American Nations",
              "otherAcronyms": ["UNASUR", "UNASUL", "UZAN"],
              "otherNames": [
                "Unión de Naciones Suramericanas",
                "União de Nações Sul-Americanas",
                "Unie van Zuid-Amerikaanse Naties",
                "South American Union"
              ]
            }
          ],
          "cioc": "COL",
        };

        expect(result, expectedMap);
      },
    );
  });
}
