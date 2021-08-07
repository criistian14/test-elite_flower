import 'package:hive/hive.dart';
import 'package:testeliteflower/src/features/users/domain/entities/config_local.dart';

part 'config_local_model.g.dart';

@HiveType(typeId: 5)
class ConfigLocalModel extends ConfigLocal {
  @HiveField(0)
  final bool? isDarkMode;

  @HiveField(1)
  final String? language;

  ConfigLocalModel({
    this.isDarkMode,
    this.language,
  }) : super(
          isDarkMode: isDarkMode,
          language: language,
        );

  ConfigLocalModel copyWith({
    bool? isDarkMode,
    String? language,
  }) {
    return ConfigLocalModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      language: language ?? this.language,
    );
  }
}
