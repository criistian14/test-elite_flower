import 'package:dartz/dartz.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/core/utils/network_info.dart';
import 'package:testeliteflower/src/features/countries/data/datasources/local/country_local_data_source.dart';
import 'package:testeliteflower/src/features/countries/data/datasources/remote/country_remote_data_source.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';
import 'package:testeliteflower/src/features/countries/domain/repositories/country_repository.dart';

class CountryRepositoryImpl implements CountryRepository {
  final CountryRemoteDataSource remoteDataSource;
  final CountryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CountryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Country?>> getCountry(String code) async {
    try {
      Country? countryFound;

      if (await networkInfo.isConnected) {
        countryFound = await remoteDataSource.getCountry(code);
      } else {
        countryFound = await localDataSource.getCountry(code);
      }

      return right(countryFound);

      //  Errors
    } on ApiException catch (e) {
      return left(ServerFailure(
        error: e.error,
        code: e.code,
      ));
    } on CacheException catch (e) {
      return left(CacheFailure(
        error: e.error,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> saveCountry(Country country) async {
    try {
      await localDataSource.saveCountry(country as CountryModel);
      return right(null);

      //  Errors
    } on CacheException catch (e) {
      return left(CacheFailure(
        error: e.error,
      ));
    }
  }
}
