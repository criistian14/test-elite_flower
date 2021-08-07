import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/features/countries/data/datasources/local/country_local_data_source.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'country_local_data_source_test.mocks.dart';

@GenerateMocks([HiveInterface, Box])
void main() {
  late CountryLocalDataSourceImpl dataSource;
  late HiveInterface mockHive;
  late Box<Country> mockBox;

  setUp(() {
    mockHive = MockHiveInterface();
    mockBox = MockBox();
    dataSource = CountryLocalDataSourceImpl(
      hive: mockHive,
    );
  });

  void setUpMockHiveSuccess() {
    final Map<String, dynamic> jsonMap = jsonDecode(
      fixture("country_col.json"),
    );

    when(mockHive.box("countries")).thenReturn(
      mockBox,
    );

    when(mockBox.get(any)).thenReturn(
      CountryModel.fromJson(jsonMap),
    );
  }

  void setUpMockHiveFailure() {
    when(mockHive.box("countries")).thenThrow(
      HiveError("Error"),
    );
  }

  group("getCountry", () {
    test(
      "should return country cached",
      () async {
        // arrange
        setUpMockHiveSuccess();
        final Map<String, dynamic> jsonMap = jsonDecode(
          fixture("country_col.json"),
        );
        final tCountry = CountryModel.fromJson(jsonMap);

        // act
        final result = await dataSource.getCountry("col");

        // assert
        verify(mockHive.box("countries"));
        verify(mockBox.get(any));
        expect(result, tCountry);
      },
    );

    test(
      "should throw a CacheException",
      () async {
        // arrange
        setUpMockHiveFailure();

        // act
        final call = dataSource.getCountry;

        // assert
        expect(() => call("col"), throwsA(isA<CacheException>()));
      },
    );
  });
}
