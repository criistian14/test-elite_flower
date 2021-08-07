import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';

abstract class ThemeRepository {
  // Get theme mode user
  Future<Either<Failure, ThemeMode>> getTheme();

  // Save
  Future<Either<Failure, void>> setTheme(ThemeMode themeMode);
}
