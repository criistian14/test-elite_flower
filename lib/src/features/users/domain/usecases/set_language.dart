import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testeliteflower/src/core/errors/failures.dart';
import 'package:testeliteflower/src/core/usecases/usecase.dart';
import 'package:testeliteflower/src/features/users/domain/repositories/language_repository.dart';

class SetLanguage extends UseCase<void, Locale> {
  final LanguageRepository repository;

  SetLanguage({
    required this.repository,
  });

  @override
  Future<Either<Failure, void>> call(Locale locale) {
    Get.updateLocale(locale);
    return repository.saveLanguage(locale);
  }
}
