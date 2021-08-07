import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testeliteflower/src/core/utils/network_info.dart';
import 'package:testeliteflower/src/features/countries/data/datasources/local/country_local_data_source.dart';
import 'package:testeliteflower/src/features/countries/data/datasources/remote/country_remote_data_source.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';
import 'package:testeliteflower/src/features/countries/data/repositories/country_repository_impl.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'country_repository_impl_test.mocks.dart';

@GenerateMocks([
  NetworkInfo,
  CountryRemoteDataSource,
  CountryLocalDataSource,
])
void main() {
  late CountryRepositoryImpl repository;
  late MockCountryRemoteDataSource mockRemoteDataSource;
  late MockCountryLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockCountryRemoteDataSource();
    mockLocalDataSource = MockCountryLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CountryRepositoryImpl(
      networkInfo: mockNetworkInfo,
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group("getCountry", () {
    final Map<String, dynamic> jsonMap = jsonDecode(
      fixture("country_col.json"),
    );
    final tCountry = CountryModel.fromJson(jsonMap);

    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
        "should return remote data when the call to remote data source is successful",
        () async {
          // arrange
          when(mockRemoteDataSource.getCountry(any))
              .thenAnswer((_) async => tCountry);

          // act
          final result = await repository.getCountry("col");

          // assert
          verify(mockRemoteDataSource.getCountry("col"));
          expect(result, Right(tCountry));
        },
      );
    });

    group("device is offline", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
        "should return cache data",
        () async {
          // arrange
          when(mockLocalDataSource.getCountry(any))
              .thenAnswer((_) async => tCountry);

          // act
          final result = await repository.getCountry("col");

          // assert
          verify(mockLocalDataSource.getCountry("col"));
          expect(result, Right(tCountry));
        },
      );

      test(
        "should save country from remote",
        () async {
          // act
          final result = await repository.saveCountry(tCountry);

          // assert
          verify(mockLocalDataSource.saveCountry(tCountry));
          expect(result, Right(null));
        },
      );
    });
  });
}
