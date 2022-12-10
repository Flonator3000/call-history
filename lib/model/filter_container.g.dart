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
    return FilterContainer()
      ..minDuration = fields[0] as int
      ..startDate = fields[1] as DateTime?
      ..endDate = fields[2] as DateTime?;
  }

  @override
  void write(BinaryWriter writer, FilterContainer obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.minDuration)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.endDate);
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
