// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JokeModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JokeModelAdapter extends TypeAdapter<JokeModel> {
  @override
  final int typeId = 1;

  @override
  JokeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return JokeModel(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, JokeModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.joke);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JokeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
