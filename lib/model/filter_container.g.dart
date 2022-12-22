// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_container.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilterContainerAdapter extends TypeAdapter<_$_FilterContainer> {
  @override
  final int typeId = 0;

  @override
  _$_FilterContainer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_FilterContainer(
      minDuration: fields[0] as int,
      startDate: fields[1] as DateTime?,
      endDate: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_FilterContainer obj) {
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
  bool operator ==(Object other) => identical(this, other) || other is FilterContainerAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FilterContainer _$$_FilterContainerFromJson(Map<String, dynamic> json) => _$_FilterContainer(
      minDuration: json['minDuration'] as int,
      startDate: json['startDate'] == null ? null : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null ? null : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$_FilterContainerToJson(_$_FilterContainer instance) => <String, dynamic>{
      'minDuration': instance.minDuration,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };
