// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryModelAdapter extends TypeAdapter<CountryModel> {
  @override
  final int typeId = 0;

  @override
  CountryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryModel(
      name: fields[0] as String,
      topLevelDomain: (fields[1] as List).cast<String>(),
      alpha2Code: fields[2] as String?,
      alpha3Code: fields[3] as String?,
      callingCodes: (fields[4] as List?)?.cast<String>(),
      capital: fields[5] as String?,
      altSpellings: (fields[6] as List?)?.cast<String>(),
      region: fields[7] as String?,
      subRegion: fields[8] as String?,
      population: fields[9] as int?,
      lat: fields[10] as double,
      lng: fields[11] as double,
      demonym: fields[12] as String?,
      area: fields[13] as double?,
      gini: fields[14] as double?,
      timezones: (fields[15] as List).cast<String>(),
      borders: (fields[16] as List?)?.cast<String>(),
      nativeName: fields[17] as String,
      numericCode: fields[18] as String?,
      currencies: (fields[19] as List?)?.cast<CurrencyModel>(),
      languages: (fields[20] as List?)?.cast<LanguageModel>(),
      translations: fields[21] as TranslationsModel?,
      flag: fields[22] as String,
      regionalBlocs: (fields[23] as List?)?.cast<RegionalBlocModel>(),
      cioc: fields[24] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryModel obj) {
    writer
      ..writeByte(25)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.topLevelDomain)
      ..writeByte(2)
      ..write(obj.alpha2Code)
      ..writeByte(3)
      ..write(obj.alpha3Code)
      ..writeByte(4)
      ..write(obj.callingCodes)
      ..writeByte(5)
      ..write(obj.capital)
      ..writeByte(6)
      ..write(obj.altSpellings)
      ..writeByte(7)
      ..write(obj.region)
      ..writeByte(8)
      ..write(obj.subRegion)
      ..writeByte(9)
      ..write(obj.population)
      ..writeByte(10)
      ..write(obj.lat)
      ..writeByte(11)
      ..write(obj.lng)
      ..writeByte(12)
      ..write(obj.demonym)
      ..writeByte(13)
      ..write(obj.area)
      ..writeByte(14)
      ..write(obj.gini)
      ..writeByte(15)
      ..write(obj.timezones)
      ..writeByte(16)
      ..write(obj.borders)
      ..writeByte(17)
      ..write(obj.nativeName)
      ..writeByte(18)
      ..write(obj.numericCode)
      ..writeByte(19)
      ..write(obj.currencies)
      ..writeByte(20)
      ..write(obj.languages)
      ..writeByte(21)
      ..write(obj.translations)
      ..writeByte(22)
      ..write(obj.flag)
      ..writeByte(23)
      ..write(obj.regionalBlocs)
      ..writeByte(24)
      ..write(obj.cioc);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
