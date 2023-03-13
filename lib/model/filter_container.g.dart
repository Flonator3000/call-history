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
      isCallTypeIncomingAccepted: fields[3] as bool,
      isCallTypeOutgoingAccepted: fields[4] as bool,
      isCallTypeMissedAccepted: fields[5] as bool,
      isCallTypeRejectedAccepted: fields[6] as bool,
      isCallTypeBlockedAccepted: fields[7] as bool,
      callParticipant: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_FilterContainer obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.minDuration)
      ..writeByte(1)
      ..write(obj.startDate)
      ..writeByte(2)
      ..write(obj.endDate)
      ..writeByte(3)
      ..write(obj.isCallTypeIncomingAccepted)
      ..writeByte(4)
      ..write(obj.isCallTypeOutgoingAccepted)
      ..writeByte(5)
      ..write(obj.isCallTypeMissedAccepted)
      ..writeByte(6)
      ..write(obj.isCallTypeRejectedAccepted)
      ..writeByte(7)
      ..write(obj.isCallTypeBlockedAccepted)
      ..writeByte(8)
      ..write(obj.callParticipant);
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
      isCallTypeIncomingAccepted: json['isCallTypeIncomingAccepted'] as bool,
      isCallTypeOutgoingAccepted: json['isCallTypeOutgoingAccepted'] as bool,
      isCallTypeMissedAccepted: json['isCallTypeMissedAccepted'] as bool,
      isCallTypeRejectedAccepted: json['isCallTypeRejectedAccepted'] as bool,
      isCallTypeBlockedAccepted: json['isCallTypeBlockedAccepted'] as bool,
      callParticipant: json['callParticipant'] as String?,
    );

Map<String, dynamic> _$$_FilterContainerToJson(_$_FilterContainer instance) => <String, dynamic>{
      'minDuration': instance.minDuration,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'isCallTypeIncomingAccepted': instance.isCallTypeIncomingAccepted,
      'isCallTypeOutgoingAccepted': instance.isCallTypeOutgoingAccepted,
      'isCallTypeMissedAccepted': instance.isCallTypeMissedAccepted,
      'isCallTypeRejectedAccepted': instance.isCallTypeRejectedAccepted,
      'isCallTypeBlockedAccepted': instance.isCallTypeBlockedAccepted,
      'callParticipant': instance.callParticipant,
    };
