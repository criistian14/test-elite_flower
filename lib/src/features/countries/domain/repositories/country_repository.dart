import 'package:dartz/dartz.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';

abstract class CountryRepository {
  // Find / Get one country by code
  Future<Either<Failure, Country?>> getCountry(String code);

  // Save Country
  Future<Either<Failure, void>> saveCountry(
    Country country,
  );
}
