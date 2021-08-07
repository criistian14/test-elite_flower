import 'package:hive/hive.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/currency.dart';

part 'currency_model.g.dart';

@HiveType(typeId: 1)
class CurrencyModel extends Currency {
  @HiveField(0)
  final String code;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? symbol;

  CurrencyModel({
    required this.code,
    required this.name,
    this.symbol,
  }) : super(
          code: code,
          name: name,
          symbol: symbol,
        );

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
      };
}
