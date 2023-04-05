// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HtmlModelAdapter extends TypeAdapter<HtmlModel> {
  @override
  final int typeId = 1;

  @override
  HtmlModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HtmlModel(
      html: fields[0] as String,
      id: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, HtmlModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.html)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HtmlModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
