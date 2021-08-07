import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/core/usecases/usecase.dart';
import 'package:testeliteflower/src/features/users/domain/repositories/language_repository.dart';

class GetLanguage extends UseCase<Locale?, NoParams> {
  final LanguageRepository repository;

  GetLanguage({
    required this.repository,
  });

  @override
  Future<Either<Failure, Locale?>> call(NoParams _) {
    return repository.getLanguage();
  }
}
