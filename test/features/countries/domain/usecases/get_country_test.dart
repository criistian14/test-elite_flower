import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';
import 'package:testeliteflower/src/features/countries/domain/repositories/country_repository.dart';
import 'package:testeliteflower/src/features/countries/domain/usecases/get_country.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'get_country_test.mocks.dart';

@GenerateMocks([CountryRepository])
void main() {
  late GetCountry getCountry;
  late MockCountryRepository mockRepository;

  setUp(() {
    mockRepository = MockCountryRepository();
    getCountry = GetCountry(repository: mockRepository);
  });

  final Map<String, dynamic> jsonMap = jsonDecode(
    fixture("country_col.json"),
  );
  final tCountry = CountryModel.fromJson(jsonMap);

  test(
    "should get country from the repository",
    () async {
      // arrange
      when(mockRepository.getCountry(any))
          .thenAnswer((_) async => Right(tCountry));

      // act
      final result = await getCountry("col");

      // assert
      verify(mockRepository.getCountry("col"));
      verifyNoMoreInteractions(mockRepository);
      expect(result, Right(tCountry));
    },
  );
}
