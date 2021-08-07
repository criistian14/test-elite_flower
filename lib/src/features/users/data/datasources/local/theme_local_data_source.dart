import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/features/users/data/models/config_local_model.dart';
import 'package:testeliteflower/src/features/users/domain/entities/config_local.dart';

abstract class ThemeLocalDataSource {
  /// Gets the cached [ThemeMode] which was gotten the last time
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<ThemeMode> getTheme();

  /// Save [ThemeMode] in cache by [FlutterSecureStorage]
  Future<void> setTheme(ThemeMode themeMode);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final HiveInterface hive;

  ThemeLocalDataSourceImpl({
    required this.hive,
  });

  @override
  Future<ThemeMode> getTheme() async {
    try {
      Box<ConfigLocal> configBox = hive.box<ConfigLocal>("config");

      if (configBox.values.isEmpty) {
        return ThemeMode.light;
      }

      ConfigLocalModel? config = configBox.values.first as ConfigLocalModel?;
      if (config == null) return ThemeMode.light;

      if (config.isDarkMode != null) {
        if (config.isDarkMode!) {
          return ThemeMode.dark;
        }
      }

      return ThemeMode.light;
    } catch (e) {
      throw (CacheException(
        error: e.toString(),
      ));
    }
  }

  @override
  Future<void> setTheme(ThemeMode themeMode) async {
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
        isDarkMode: themeMode == ThemeMode.dark ? true : false,
      );

      configBox.put(0, config);
    } catch (e) {
      throw (CacheException(
        error: e.toString(),
      ));
    }
  }
}
