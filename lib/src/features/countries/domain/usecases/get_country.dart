import 'package:dartz/dartz.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/core/usecases/usecase.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';
import 'package:testeliteflower/src/features/countries/domain/repositories/country_repository.dart';

class GetCountry extends UseCase<Country?, String> {
  final CountryRepository repository;

  GetCountry({
    required this.repository,
  });

  @override
  Future<Either<Failure, Country?>> call(String code) {
    return repository.getCountry(code);
  }
}
