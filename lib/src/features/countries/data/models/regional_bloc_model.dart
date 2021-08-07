import 'package:hive/hive.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/regional_bloc.dart';

part 'regional_bloc_model.g.dart';

@HiveType(typeId: 4)
class RegionalBlocModel extends RegionalBloc {
  @HiveField(0)
  final String acronym;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<String>? otherAcronyms;

  @HiveField(3)
  final List<String>? otherNames;

  RegionalBlocModel({
    required this.acronym,
    required this.name,
    this.otherAcronyms,
    this.otherNames,
  }) : super(
          acronym: acronym,
          name: name,
          otherAcronyms: otherAcronyms,
          otherNames: otherNames,
        );

  factory RegionalBlocModel.fromJson(Map<String, dynamic> json) =>
      RegionalBlocModel(
        acronym: json["acronym"],
        name: json["name"],
        otherAcronyms: List<String>.from(json["otherAcronyms"].map((x) => x)),
        otherNames: List<String>.from(json["otherNames"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "acronym": acronym,
        "name": name,
        "otherAcronyms": otherAcronyms != null
            ? List<dynamic>.from(otherAcronyms!.map((x) => x))
            : null,
        "otherNames": otherNames != null
            ? List<dynamic>.from(otherNames!.map((x) => x))
            : null,
      };
}
