import 'package:call_history/model/hive/adapter_names.dart';
import 'package:call_history/model/hive/hive_type_ids.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'filter_container.freezed.dart';
part 'filter_container.g.dart';

@freezed
class FilterContainer with _$FilterContainer {
  @HiveType(typeId: HiveTypeIds.FILTER_CONTAINER, adapterName: AdapterNames.FILTER_CONTAINER_ADAPTER_NAME)
  const factory FilterContainer({
    @HiveField(0) required int minDuration,
    @HiveField(1) DateTime? startDate,
    @HiveField(2) DateTime? endDate,
    @HiveField(3) required bool isCallTypeIncomingAccepted,
    @HiveField(4) required bool isCallTypeOutgoingAccepted,
    @HiveField(5) required bool isCallTypeMissedAccepted,
    @HiveField(6) required bool isCallTypeRejectedAccepted,
    @HiveField(7) required bool isCallTypeBlockedAccepted,
    @HiveField(8) String? callParticipant,
  }) = _FilterContainer;

  factory FilterContainer.fromJson(Map<String, dynamic> json) => _$FilterContainerFromJson(json);
}