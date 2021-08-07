import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:testeliteflower/src/features/countries/data/models/regional_bloc_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/regional_bloc.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tRegionalBlocModel = RegionalBlocModel(
    acronym: "PA",
    name: "Pacific Alliance",
    otherAcronyms: [],
    otherNames: ["Alianza del Pacífico"],
  );

  test(
    "should be a subclass of RegionalBloc entity",
    () async {
      // assert
      expect(tRegionalBlocModel, isA<RegionalBloc>());
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
        final result = List<RegionalBlocModel>.from(
          jsonMap["regionalBlocs"].map((x) => RegionalBlocModel.fromJson(x)),
        );

        // assert
        expect(result.first, isA<RegionalBloc>());
        expect(result.first, tRegionalBlocModel);
      },
    );
  });

  group("toJson", () {
    test(
      "should return a JSON map containing the proper data",
      () async {
        // arrange
        final result = tRegionalBlocModel.toJson();

        // assert
        final expectedMap = {
          "acronym": "PA",
          "name": "Pacific Alliance",
          "otherAcronyms": [],
          "otherNames": ["Alianza del Pacífico"],
        };

        expect(result, expectedMap);
      },
    );
  });
}
