// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_container.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilterContainerAdapter extends TypeAdapter<FilterContainer> {
  @override
  final int typeId = 0;

  @override
  FilterContainer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FilterContainer()..minDuration = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, FilterContainer obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.minDuration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterContainerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
