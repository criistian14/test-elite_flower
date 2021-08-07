import 'package:dartz/dartz.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/core/usecases/usecase.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';
import 'package:testeliteflower/src/features/countries/domain/repositories/country_repository.dart';

class SaveCountry extends UseCase<void, Country> {
  final CountryRepository repository;

  SaveCountry({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(Country country) {
    return repository.saveCountry(country);
  }
}
