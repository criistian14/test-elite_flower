import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';

abstract class LanguageRepository {
  // Get language user
  Future<Either<Failure, Locale?>> getLanguage();

  // Save language user
  Future<Either<Failure, void>> saveLanguage(Locale locale);
}
