import 'dart:ui';

import 'package:dartz/dartz.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/features/users/data/datasources/local/language_local_data_source.dart';
import 'package:testeliteflower/src/features/users/domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageLocalDataSource localDataSource;

  LanguageRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Locale?>> getLanguage() async {
    try {
      Locale? locale = await localDataSource.getLanguage();
      return Right(locale);

      //  Errors
    } on CacheException catch (e) {
      return Left(CacheFailure(
        error: e.error,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> saveLanguage(Locale locale) async {
    try {
      await localDataSource.saveLanguage(locale);
      return Right(null);

      //  Errors
    } on CacheException catch (e) {
      return Left(CacheFailure(
        error: e.error,
      ));
    }
  }
}
