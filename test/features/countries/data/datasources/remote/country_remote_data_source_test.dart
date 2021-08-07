import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/features/countries/data/datasources/remote/country_remote_data_source.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'country_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late CountryRemoteDataSourceImpl dataSource;
  late MockDio mockDioClient;

  setUp(() {
    mockDioClient = MockDio();
    dataSource = CountryRemoteDataSourceImpl(
      clientHttp: mockDioClient,
    );
  });

  void setUpMockDioSuccess() {
    final Map<String, dynamic> jsonMap = jsonDecode(
      fixture("country_col.json"),
    );

    when(mockDioClient.get(any)).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: jsonMap,
        requestOptions: RequestOptions(
          path: '',
        ),
      ),
    );
  }

  void setUpMockDioFailure() {
    when(mockDioClient.get(any)).thenAnswer(
      (_) async => Response(
        statusCode: 400,
        data: jsonEncode({
          "status": 400,
          "message": "Bad Request",
        }),
        requestOptions: RequestOptions(
          path: '',
        ),
      ),
    );
  }

  group("getCountry", () {
    test(
      "should return country of request get",
      () async {
        // arrange
        setUpMockDioSuccess();
        final Map<String, dynamic> jsonMap = jsonDecode(
          fixture("country_col.json"),
        );
        final tCountry = CountryModel.fromJson(jsonMap);

        // act
        final result = await dataSource.getCountry("col");

        // assert
        verify(mockDioClient.get(any));
        expect(result, tCountry);
      },
    );

    test(
      "should throw a ServerException when the response code",
      () async {
        // arrange
        setUpMockDioFailure();

        // act
        final call = dataSource.getCountry;

        // assert
        expect(() => call("col"), throwsA(isA<ApiException>()));
      },
    );
  });
}
