// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigLocalModelAdapter extends TypeAdapter<ConfigLocalModel> {
  @override
  final int typeId = 5;

  @override
  ConfigLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigLocalModel(
      isDarkMode: fields[0] as bool?,
      language: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ConfigLocalModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isDarkMode)
      ..writeByte(1)
      ..write(obj.language);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
