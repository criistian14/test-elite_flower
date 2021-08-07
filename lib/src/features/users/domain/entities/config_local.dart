import 'package:equatable/equatable.dart';

class ConfigLocal extends Equatable {
  final bool? isDarkMode;
  final String? language;

  ConfigLocal({
    this.isDarkMode,
    this.language,
  });

  @override
  List get props => [
        isDarkMode,
        language,
      ];
}
