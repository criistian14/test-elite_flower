import 'package:hive/hive.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/language.dart';

part 'language_model.g.dart';

@HiveType(typeId: 2)
class LanguageModel extends Language {
  @HiveField(0)
  final String iso6391;

  @HiveField(1)
  final String? iso6392;

  @HiveField(2)
  final String name;

  @HiveField(3)
  final String nativeName;

  LanguageModel({
    required this.iso6391,
    this.iso6392,
    required this.name,
    required this.nativeName,
  }) : super(
          iso6391: iso6391,
          iso6392: iso6392,
          name: name,
          nativeName: nativeName,
        );

  factory LanguageModel.fromJson(Map<String, dynamic> json) => LanguageModel(
        iso6391: json["iso639_1"],
        iso6392: json["iso639_2"],
        name: json["name"],
        nativeName: json["nativeName"],
      );

  Map<String, dynamic> toJson() => {
        "iso639_1": iso6391,
        "iso639_2": iso6392,
        "name": name,
        "nativeName": nativeName,
      };
}
