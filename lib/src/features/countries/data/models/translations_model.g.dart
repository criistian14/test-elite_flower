// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TranslationsModelAdapter extends TypeAdapter<TranslationsModel> {
  @override
  final int typeId = 3;

  @override
  TranslationsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TranslationsModel(
      de: fields[0] as String?,
      es: fields[1] as String?,
      fr: fields[2] as String?,
      ja: fields[3] as String?,
      it: fields[4] as String?,
      br: fields[5] as String?,
      pt: fields[6] as String?,
      nl: fields[7] as String?,
      hr: fields[8] as String?,
      fa: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TranslationsModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.de)
      ..writeByte(1)
      ..write(obj.es)
      ..writeByte(2)
      ..write(obj.fr)
      ..writeByte(3)
      ..write(obj.ja)
      ..writeByte(4)
      ..write(obj.it)
      ..writeByte(5)
      ..write(obj.br)
      ..writeByte(6)
      ..write(obj.pt)
      ..writeByte(7)
      ..write(obj.nl)
      ..writeByte(8)
      ..write(obj.hr)
      ..writeByte(9)
      ..write(obj.fa);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslationsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
