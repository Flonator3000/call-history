import 'package:call_history/model/hive/adapter_names.dart';
import 'package:call_history/model/hive/hive_type_ids.dart';
import 'package:hive/hive.dart';

part 'filter_container.g.dart';

@HiveType(typeId: HiveTypeIds.FILTER_CONTAINER, adapterName: AdapterNames.FILTER_CONTAINER_ADAPTER_NAME)
class FilterContainer extends HiveObject {
  @HiveField(0) int minDuration = 0;
}