import 'package:hive/hive.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/translations.dart';

part 'translations_model.g.dart';

@HiveType(typeId: 3)
class TranslationsModel extends Translations {
  @HiveField(0)
  final String? de;

  @HiveField(1)
  final String? es;

  @HiveField(2)
  final String? fr;

  @HiveField(3)
  final String? ja;

  @HiveField(4)
  final String? it;

  @HiveField(5)
  final String? br;

  @HiveField(6)
  final String? pt;

  @HiveField(7)
  final String? nl;

  @HiveField(8)
  final String? hr;

  @HiveField(9)
  final String? fa;

  TranslationsModel({
    this.de,
    this.es,
    this.fr,
    this.ja,
    this.it,
    this.br,
    this.pt,
    this.nl,
    this.hr,
    this.fa,
  }) : super(
          de: de,
          es: es,
          fr: fr,
          ja: ja,
          it: it,
          br: br,
          pt: pt,
          nl: nl,
          hr: hr,
          fa: fa,
        );

  factory TranslationsModel.fromJson(Map<String, dynamic> json) =>
      TranslationsModel(
        de: json["de"],
        es: json["es"],
        fr: json["fr"],
        ja: json["ja"],
        it: json["it"],
        br: json["br"],
        pt: json["pt"],
        nl: json["nl"],
        hr: json["hr"],
        fa: json["fa"],
      );

  Map<String, dynamic> toJson() => {
        "de": de,
        "es": es,
        "fr": fr,
        "ja": ja,
        "it": it,
        "br": br,
        "pt": pt,
        "nl": nl,
        "hr": hr,
        "fa": fa,
      };
}
