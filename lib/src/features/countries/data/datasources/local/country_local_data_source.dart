import 'package:hive/hive.dart';
import 'package:testeliteflower/src/core/errors/exceptions.dart';
import 'package:testeliteflower/src/features/countries/data/models/country_model.dart';
import 'package:testeliteflower/src/features/countries/domain/entities/country.dart';

abstract class CountryLocalDataSource {
  /// Gets the cached [Country] which was gotten the last time
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<CountryModel?> getCountry(String code);

  /// Save [Country] in cache by [FlutterSecureStorage]
  Future<void> saveCountry(CountryModel country);
}

class CountryLocalDataSourceImpl implements CountryLocalDataSource {
  final HiveInterface hive;

  CountryLocalDataSourceImpl({
    required this.hive,
  });

  @override
  Future<CountryModel?> getCountry(String code) async {
    try {
      Box<Country> countryBox = hive.box<Country>("countries");

      CountryModel? countryFound =
          countryBox.get(code.toLowerCase()) as CountryModel?;

      return countryFound;
    } catch (e) {
      throw (CacheException(
        error: e.toString(),
      ));
    }
  }

  @override
  Future<void> saveCountry(CountryModel country) async {
    try {
      Box<Country> countryBox = hive.box<Country>("countries");
      CountryModel? countryFound;
      String? code = country.alpha3Code ?? country.alpha2Code;

      if (countryBox.values.isNotEmpty) {
        countryFound = countryBox.get(code!.toLowerCase()) as CountryModel?;
      }

      if (countryFound != null) {
        if (countryFound == country) return;
      }

      await countryBox.put(code!.toLowerCase(), country);
    } catch (e) {
      throw (CacheException(
        error: e.toString(),
      ));
    }
  }
}
