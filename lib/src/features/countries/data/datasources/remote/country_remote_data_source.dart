import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';

abstract class CountryRemoteDataSource {
  /// Gets the cached [Country] which was gotten the last time
  ///
  /// Throws [ApiException] if no cached data is present.
  Future<CountryModel> getCountry(String code);
}

class CountryRemoteDataSourceImpl implements CountryRemoteDataSource {
  final Dio clientHttp;

  CountryRemoteDataSourceImpl({
    required this.clientHttp,
  });

  @override
  Future<CountryModel> getCountry(String code) async {
    final response = await clientHttp.get("/alpha/$code");

    if (response.statusCode != 200) {
      throw ApiException(
        error: response.data,
        code: response.statusCode,
      );
    }

    try {
      return CountryModel.fromJson(response.data);
    } catch (e) {
      throw ApiException(
        error: "error: parsing data Country",
      );
    }
  }
}
