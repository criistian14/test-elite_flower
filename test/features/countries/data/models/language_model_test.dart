import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:testeliteflower/src/features/countries/data/models/language_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/language.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tLanguageModel = LanguageModel(
    iso6391: "es",
    iso6392: "spa",
    name: "Spanish",
    nativeName: "Español",
  );

  test(
    "should be a subclass of Language entity",
    () async {
      // assert
      expect(tLanguageModel, isA<Language>());
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
        final result = List<LanguageModel>.from(
          jsonMap["languages"].map((x) => LanguageModel.fromJson(x)),
        );

        // assert
        expect(result.first, isA<Language>());
        expect(result.first, tLanguageModel);
      },
    );
  });

  group("toJson", () {
    test(
      "should return a JSON map containing the proper data",
      () async {
        // arrange
        final result = tLanguageModel.toJson();

        // assert
        final expectedMap = {
          "iso639_1": "es",
          "iso639_2": "spa",
          "name": "Spanish",
          "nativeName": "Español",
        };

        expect(result, expectedMap);
      },
    );
  });
}
