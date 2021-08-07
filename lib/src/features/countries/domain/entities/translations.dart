import 'package:equatable/equatable.dart';

class Translations extends Equatable {
  final String? de;
  final String? es;
  final String? fr;
  final String? ja;
  final String? it;
  final String? br;
  final String? pt;
  final String? nl;
  final String? hr;
  final String? fa;

  Translations({
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
  });

  @override
  List get props => [
        de,
        es,
        fr,
        ja,
        it,
        br,
        pt,
        nl,
        hr,
        fa,
      ];
}
