import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/features/users/data/models/config_local_model.dart';
import 'package:testeliteflower/src/features/users/domain/entities/config_local.dart';

abstract class LanguageLocalDataSource {
  /// Gets the cached [Locale] which was gotten the last time
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<Locale?> getLanguage();

  /// Save [Locale] in cache by [Hive.box]
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<void> saveLanguage(Locale locale);
}

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final HiveInterface hive;

  LanguageLocalDataSourceImpl({
    required this.hive,
  });

  @override
  Future<Locale?> getLanguage() async {
    try {
      Box<ConfigLocal> configBox = hive.box<ConfigLocal>("config");
      if (configBox.values.isEmpty) {
        return null;
      }

      ConfigLocalModel? config = configBox.values.first as ConfigLocalModel?;
      if (config == null) return null;

      if (config.language == null || config.language!.isEmpty) {
        return null;
      }

      return Locale(config.language!);
    } catch (e) {
      throw (CacheException(
        error: e.toString(),
      ));
    }
  }

  @override
  Future<void> saveLanguage(Locale locale) async {
    try {
      Box<ConfigLocal> configBox = hive.box<ConfigLocal>("config");
      ConfigLocalModel? config;

      if (configBox.values.isNotEmpty) {
        config = configBox.values.first as ConfigLocalModel?;
      }

      if (config == null) {
        config = ConfigLocalModel();
      }

      config = config.copyWith(
        language: locale.languageCode,
      );

      configBox.put(0, config);
    } catch (e) {
      throw (CacheException(
        error: e.toString(),
      ));
    }
  }
}
