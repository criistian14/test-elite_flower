import 'package:equatable/equatable.dart';

class Currency extends Equatable {
  final String code;
  final String name;
  final String? symbol;

  Currency({
    required this.code,
    required this.name,
    this.symbol,
  });

  @override
  List get props => [
        code,
        name,
        symbol,
      ];
}
