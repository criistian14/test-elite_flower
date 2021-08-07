// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regional_bloc_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegionalBlocModelAdapter extends TypeAdapter<RegionalBlocModel> {
  @override
  final int typeId = 4;

  @override
  RegionalBlocModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegionalBlocModel(
      acronym: fields[0] as String,
      name: fields[1] as String,
      otherAcronyms: (fields[2] as List?)?.cast<String>(),
      otherNames: (fields[3] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RegionalBlocModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.acronym)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.otherAcronyms)
      ..writeByte(3)
      ..write(obj.otherNames);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegionalBlocModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
