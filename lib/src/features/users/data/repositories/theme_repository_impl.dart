import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/core/utils/network_info.dart';
import 'package:testeliteflower/src/features/users/data/datasources/local/theme_local_data_source.dart';
import 'package:testeliteflower/src/features/users/domain/repositories/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, ThemeMode>> getTheme() async {
    try {
      ThemeMode theme = await localDataSource.getTheme();
      return Right(theme);

      //  Errors
    } on CacheException catch (e) {
      return Left(CacheFailure(
        error: e.error,
      ));
    }
  }

  @override
  Future<Either<Failure, void>> setTheme(ThemeMode themeMode) async {
    try {
      await localDataSource.setTheme(themeMode);
      return Right(null);

      //  Errors
    } on CacheException catch (e) {
      return Left(CacheFailure(
        error: e.error,
      ));
    }
  }
}
