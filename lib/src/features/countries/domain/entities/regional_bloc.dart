import 'package:equatable/equatable.dart';

class RegionalBloc extends Equatable {
  final String acronym;
  final String name;
  final List<String>? otherAcronyms;
  final List<String>? otherNames;

  RegionalBloc({
    required this.acronym,
    required this.name,
    this.otherAcronyms,
    this.otherNames,
  });

  @override
  List get props => [
        acronym,
        name,
        otherAcronyms,
        otherNames,
      ];
}
