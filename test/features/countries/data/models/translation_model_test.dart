import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:testeliteflower/src/features/countries/data/models/translations_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/translations.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTranslationModel = TranslationsModel(
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
  );

  test(
    "should be a subclass of Translation entity",
    () async {
      // assert
      expect(tTranslationModel, isA<Translations>());
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
        final result = TranslationsModel.fromJson(jsonMap["translations"]);

        // assert
        expect(result, isA<Translations>());
        expect(result, tTranslationModel);
      },
    );
  });

  group("toJson", () {
    test(
      "should return a JSON map containing the proper data",
      () async {
        // arrange
        final result = tTranslationModel.toJson();

        // assert
        final expectedMap = {
          "de": "Kolumbien",
          "es": "Colombia",
          "fr": "Colombie",
          "ja": "コロンビア",
          "it": "Colombia",
          "br": "Colômbia",
          "pt": "Colômbia",
          "nl": "Colombia",
          "hr": "Kolumbija",
          "fa": "کلمبیا",
        };

        expect(result, expectedMap);
      },
    );
  });
}
