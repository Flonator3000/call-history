// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilterContainer _$FilterContainerFromJson(Map<String, dynamic> json) {
  return _FilterContainer.fromJson(json);
}

/// @nodoc
mixin _$FilterContainer {
  @HiveField(0)
  int get minDuration => throw _privateConstructorUsedError;

  @HiveField(1)
  DateTime? get startDate => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime? get endDate => throw _privateConstructorUsedError;

  @HiveField(3)
  bool get isCallTypeIncomingAccepted => throw _privateConstructorUsedError;

  @HiveField(4)
  bool get isCallTypeOutgoingAccepted => throw _privateConstructorUsedError;

  @HiveField(5)
  bool get isCallTypeMissedAccepted => throw _privateConstructorUsedError;

  @HiveField(6)
  bool get isCallTypeRejectedAccepted => throw _privateConstructorUsedError;

  @HiveField(7)
  bool get isCallTypeBlockedAccepted => throw _privateConstructorUsedError;

  @HiveField(8)
  String? get callParticipant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterContainerCopyWith<FilterContainer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterContainerCopyWith<$Res> {
  factory $FilterContainerCopyWith(FilterContainer value, $Res Function(FilterContainer) then) = _$FilterContainerCopyWithImpl<$Res, FilterContainer>;

  @useResult
  $Res call({@HiveField(0) int minDuration, @HiveField(1) DateTime? startDate, @HiveField(2) DateTime? endDate, @HiveField(3) bool isCallTypeIncomingAccepted, @HiveField(4) bool isCallTypeOutgoingAccepted, @HiveField(5) bool isCallTypeMissedAccepted, @HiveField(6) bool isCallTypeRejectedAccepted, @HiveField(7) bool isCallTypeBlockedAccepted, @HiveField(8) String? callParticipant});
}

/// @nodoc
class _$FilterContainerCopyWithImpl<$Res, $Val extends FilterContainer> implements $FilterContainerCopyWith<$Res> {
  _$FilterContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minDuration = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isCallTypeIncomingAccepted = null,
    Object? isCallTypeOutgoingAccepted = null,
    Object? isCallTypeMissedAccepted = null,
    Object? isCallTypeRejectedAccepted = null,
    Object? isCallTypeBlockedAccepted = null,
    Object? callParticipant = freezed,
  }) {
    return _then(_value.copyWith(
      minDuration: null == minDuration
          ? _value.minDuration
          : minDuration // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCallTypeIncomingAccepted: null == isCallTypeIncomingAccepted
          ? _value.isCallTypeIncomingAccepted
          : isCallTypeIncomingAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCallTypeOutgoingAccepted: null == isCallTypeOutgoingAccepted
          ? _value.isCallTypeOutgoingAccepted
          : isCallTypeOutgoingAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCallTypeMissedAccepted: null == isCallTypeMissedAccepted
          ? _value.isCallTypeMissedAccepted
          : isCallTypeMissedAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCallTypeRejectedAccepted: null == isCallTypeRejectedAccepted
          ? _value.isCallTypeRejectedAccepted
          : isCallTypeRejectedAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCallTypeBlockedAccepted: null == isCallTypeBlockedAccepted
          ? _value.isCallTypeBlockedAccepted
          : isCallTypeBlockedAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      callParticipant: freezed == callParticipant
          ? _value.callParticipant
          : callParticipant // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterContainerCopyWith<$Res> implements $FilterContainerCopyWith<$Res> {
  factory _$$_FilterContainerCopyWith(_$_FilterContainer value, $Res Function(_$_FilterContainer) then) = __$$_FilterContainerCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({@HiveField(0) int minDuration, @HiveField(1) DateTime? startDate, @HiveField(2) DateTime? endDate, @HiveField(3) bool isCallTypeIncomingAccepted, @HiveField(4) bool isCallTypeOutgoingAccepted, @HiveField(5) bool isCallTypeMissedAccepted, @HiveField(6) bool isCallTypeRejectedAccepted, @HiveField(7) bool isCallTypeBlockedAccepted, @HiveField(8) String? callParticipant});
}

/// @nodoc
class __$$_FilterContainerCopyWithImpl<$Res> extends _$FilterContainerCopyWithImpl<$Res, _$_FilterContainer> implements _$$_FilterContainerCopyWith<$Res> {
  __$$_FilterContainerCopyWithImpl(_$_FilterContainer _value, $Res Function(_$_FilterContainer) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? minDuration = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isCallTypeIncomingAccepted = null,
    Object? isCallTypeOutgoingAccepted = null,
    Object? isCallTypeMissedAccepted = null,
    Object? isCallTypeRejectedAccepted = null,
    Object? isCallTypeBlockedAccepted = null,
    Object? callParticipant = freezed,
  }) {
    return _then(_$_FilterContainer(
      minDuration: null == minDuration
          ? _value.minDuration
          : minDuration // ignore: cast_nullable_to_non_nullable
              as int,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isCallTypeIncomingAccepted: null == isCallTypeIncomingAccepted
          ? _value.isCallTypeIncomingAccepted
          : isCallTypeIncomingAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCallTypeOutgoingAccepted: null == isCallTypeOutgoingAccepted
          ? _value.isCallTypeOutgoingAccepted
          : isCallTypeOutgoingAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCallTypeMissedAccepted: null == isCallTypeMissedAccepted
          ? _value.isCallTypeMissedAccepted
          : isCallTypeMissedAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCallTypeRejectedAccepted: null == isCallTypeRejectedAccepted
          ? _value.isCallTypeRejectedAccepted
          : isCallTypeRejectedAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      isCallTypeBlockedAccepted: null == isCallTypeBlockedAccepted
          ? _value.isCallTypeBlockedAccepted
          : isCallTypeBlockedAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      callParticipant: freezed == callParticipant
          ? _value.callParticipant
          : callParticipant // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.FILTER_CONTAINER, adapterName: AdapterNames.FILTER_CONTAINER_ADAPTER_NAME)
class _$_FilterContainer implements _FilterContainer {
  const _$_FilterContainer({@HiveField(0) required this.minDuration, @HiveField(1) this.startDate, @HiveField(2) this.endDate, @HiveField(3) required this.isCallTypeIncomingAccepted, @HiveField(4) required this.isCallTypeOutgoingAccepted, @HiveField(5) required this.isCallTypeMissedAccepted, @HiveField(6) required this.isCallTypeRejectedAccepted, @HiveField(7) required this.isCallTypeBlockedAccepted, @HiveField(8) this.callParticipant});

  factory _$_FilterContainer.fromJson(Map<String, dynamic> json) => _$$_FilterContainerFromJson(json);

  @override
  @HiveField(0)
  final int minDuration;
  @override
  @HiveField(1)
  final DateTime? startDate;
  @override
  @HiveField(2)
  final DateTime? endDate;
  @override
  @HiveField(3)
  final bool isCallTypeIncomingAccepted;
  @override
  @HiveField(4)
  final bool isCallTypeOutgoingAccepted;
  @override
  @HiveField(5)
  final bool isCallTypeMissedAccepted;
  @override
  @HiveField(6)
  final bool isCallTypeRejectedAccepted;
  @override
  @HiveField(7)
  final bool isCallTypeBlockedAccepted;
  @override
  @HiveField(8)
  final String? callParticipant;

  @override
  String toString() {
    return 'FilterContainer(minDuration: $minDuration, startDate: $startDate, endDate: $endDate, isCallTypeIncomingAccepted: $isCallTypeIncomingAccepted, isCallTypeOutgoingAccepted: $isCallTypeOutgoingAccepted, isCallTypeMissedAccepted: $isCallTypeMissedAccepted, isCallTypeRejectedAccepted: $isCallTypeRejectedAccepted, isCallTypeBlockedAccepted: $isCallTypeBlockedAccepted, callParticipant: $callParticipant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_FilterContainer && (identical(other.minDuration, minDuration) || other.minDuration == minDuration) && (identical(other.startDate, startDate) || other.startDate == startDate) && (identical(other.endDate, endDate) || other.endDate == endDate) && (identical(other.isCallTypeIncomingAccepted, isCallTypeIncomingAccepted) || other.isCallTypeIncomingAccepted == isCallTypeIncomingAccepted) && (identical(other.isCallTypeOutgoingAccepted, isCallTypeOutgoingAccepted) || other.isCallTypeOutgoingAccepted == isCallTypeOutgoingAccepted) && (identical(other.isCallTypeMissedAccepted, isCallTypeMissedAccepted) || other.isCallTypeMissedAccepted == isCallTypeMissedAccepted) && (identical(other.isCallTypeRejectedAccepted, isCallTypeRejectedAccepted) || other.isCallTypeRejectedAccepted == isCallTypeRejectedAccepted) && (identical(other.isCallTypeBlockedAccepted, isCallTypeBlockedAccepted) || other.isCallTypeBlockedAccepted == isCallTypeBlockedAccepted) && (identical(other.callParticipant, callParticipant) || other.callParticipant == callParticipant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minDuration, startDate, endDate, isCallTypeIncomingAccepted, isCallTypeOutgoingAccepted, isCallTypeMissedAccepted, isCallTypeRejectedAccepted, isCallTypeBlockedAccepted, callParticipant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FilterContainerCopyWith<_$_FilterContainer> get copyWith => __$$_FilterContainerCopyWithImpl<_$_FilterContainer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FilterContainerToJson(
      this,
    );
  }
}

abstract class _FilterContainer implements FilterContainer {
  const factory _FilterContainer({@HiveField(0) required final int minDuration, @HiveField(1) final DateTime? startDate, @HiveField(2) final DateTime? endDate, @HiveField(3) required final bool isCallTypeIncomingAccepted, @HiveField(4) required final bool isCallTypeOutgoingAccepted, @HiveField(5) required final bool isCallTypeMissedAccepted, @HiveField(6) required final bool isCallTypeRejectedAccepted, @HiveField(7) required final bool isCallTypeBlockedAccepted, @HiveField(8) final String? callParticipant}) = _$_FilterContainer;

  factory _FilterContainer.fromJson(Map<String, dynamic> json) = _$_FilterContainer.fromJson;

  @override
  @HiveField(0)
  int get minDuration;

  @override
  @HiveField(1)
  DateTime? get startDate;

  @override
  @HiveField(2)
  DateTime? get endDate;
  @override
  @HiveField(3)
  bool get isCallTypeIncomingAccepted;
  @override
  @HiveField(4)
  bool get isCallTypeOutgoingAccepted;

  @override
  @HiveField(5)
  bool get isCallTypeMissedAccepted;

  @override
  @HiveField(6)
  bool get isCallTypeRejectedAccepted;

  @override
  @HiveField(7)
  bool get isCallTypeBlockedAccepted;

  @override
  @HiveField(8)
  String? get callParticipant;

  @override
  @JsonKey(ignore: true)
  _$$_FilterContainerCopyWith<_$_FilterContainer> get copyWith => throw _privateConstructorUsedError;
}
