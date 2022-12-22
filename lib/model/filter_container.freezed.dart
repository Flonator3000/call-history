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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterContainerCopyWith<FilterContainer> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterContainerCopyWith<$Res> {
  factory $FilterContainerCopyWith(FilterContainer value, $Res Function(FilterContainer) then) = _$FilterContainerCopyWithImpl<$Res, FilterContainer>;

  @useResult
  $Res call({@HiveField(0) int minDuration, @HiveField(1) DateTime? startDate, @HiveField(2) DateTime? endDate});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FilterContainerCopyWith<$Res> implements $FilterContainerCopyWith<$Res> {
  factory _$$_FilterContainerCopyWith(_$_FilterContainer value, $Res Function(_$_FilterContainer) then) = __$$_FilterContainerCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({@HiveField(0) int minDuration, @HiveField(1) DateTime? startDate, @HiveField(2) DateTime? endDate});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.FILTER_CONTAINER, adapterName: AdapterNames.FILTER_CONTAINER_ADAPTER_NAME)
class _$_FilterContainer implements _FilterContainer {
  const _$_FilterContainer({@HiveField(0) required this.minDuration, @HiveField(1) this.startDate, @HiveField(2) this.endDate});

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
  String toString() {
    return 'FilterContainer(minDuration: $minDuration, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other.runtimeType == runtimeType && other is _$_FilterContainer && (identical(other.minDuration, minDuration) || other.minDuration == minDuration) && (identical(other.startDate, startDate) || other.startDate == startDate) && (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, minDuration, startDate, endDate);

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
  const factory _FilterContainer({@HiveField(0) required final int minDuration, @HiveField(1) final DateTime? startDate, @HiveField(2) final DateTime? endDate}) = _$_FilterContainer;

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
  @JsonKey(ignore: true)
  _$$_FilterContainerCopyWith<_$_FilterContainer> get copyWith => throw _privateConstructorUsedError;
}
