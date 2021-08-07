import 'package:equatable/equatable.dart';

class Language extends Equatable {
  final String iso6391;
  final String? iso6392;
  final String name;
  final String nativeName;

  Language({
    required this.iso6391,
    this.iso6392,
    required this.name,
    required this.nativeName,
  });

  @override
  List get props => [
        iso6391,
        iso6392,
        name,
        nativeName,
      ];
}
