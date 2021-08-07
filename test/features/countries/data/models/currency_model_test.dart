import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:testeliteflower/src/features/countries/data/models/currency_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/currency.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCurrencyModel = CurrencyModel(
    code: "COP",
    name: "Colombian peso",
    symbol: "\$",
  );

  test(
    "should be a subclass of Currency entity",
    () async {
      // assert
      expect(tCurrencyModel, isA<Currency>());
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
        final result = List<CurrencyModel>.from(
          jsonMap["currencies"].map((x) => CurrencyModel.fromJson(x)),
        );

        // assert
        expect(result.first, isA<Currency>());
        expect(result.first, tCurrencyModel);
      },
    );
  });

  group("toJson", () {
    test(
      "should return a JSON map containing the proper data",
      () async {
        // arrange
        final result = tCurrencyModel.toJson();

        // assert
        final expectedMap = {
          "code": "COP",
          "name": "Colombian peso",
          "symbol": "\$",
        };

        expect(result, expectedMap);
      },
    );
  });
}
