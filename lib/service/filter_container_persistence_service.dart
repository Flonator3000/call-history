import 'package:call_history/model/filter_container.dart';
import 'package:call_history/model/hive/box_names.dart';
import 'package:hive/hive.dart';

class FilterContainerPersistenceService {
  static const MIN_DURATION_DEFAULT = 0;
  static const BOX_INDEX = 0;
  late final Box<FilterContainer> filterContainerBox;

  FilterContainerPersistenceService() {
    filterContainerBox = Hive.box<FilterContainer>(BoxNames.FILTER_CONTAINER_BOX_NAME);
  }

  update(FilterContainer filterContainer) {
    _createIfNotExisting();
    filterContainerBox.putAt(BOX_INDEX, filterContainer);
  }

  FilterContainer get() {
    _createIfNotExisting();
    FilterContainer filterContainer = filterContainerBox.getAt(BOX_INDEX)!;
    return filterContainer;
  }

  _createIfNotExisting() {
    if (filterContainerBox.containsKey(BOX_INDEX)) {
      return;
    }
    FilterContainer filterContainer = const FilterContainer(
      minDuration: 0,
      isCallTypeIncomingAccepted: true,
      isCallTypeOutgoingAccepted: true,
      isCallTypeMissedAccepted: true,
      isCallTypeRejectedAccepted: true,
      isCallTypeBlockedAccepted: true,
    );
    filterContainerBox.put(BOX_INDEX, filterContainer);
  }
}
