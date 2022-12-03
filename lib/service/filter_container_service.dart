
import 'package:call_history/model/filter_container.dart';
import 'package:call_history/model/hive/box_names.dart';
import 'package:hive/hive.dart';

class FilterContainerService {
  static const MIN_DURATION_DEFAULT = 0;
  static const BOX_INDEX = 0;
  late final Box<FilterContainer> filterContainerBox;

  FilterContainerService() {
    filterContainerBox = Hive.box<FilterContainer>(BoxNames.FILTER_CONTAINER_BOX_NAME);
  }

  setMinDuration(int minDuration) {
    _createIfNotExisting();
    FilterContainer filterContainer = filterContainerBox.getAt(BOX_INDEX)!;
    filterContainer.minDuration = minDuration;
    filterContainerBox.putAt(BOX_INDEX, filterContainer);
  }

  setStartDate(DateTime startDate) {
    _createIfNotExisting();
    FilterContainer filterContainer = filterContainerBox.getAt(BOX_INDEX)!;
    filterContainer.startDate = startDate;
    filterContainerBox.putAt(BOX_INDEX, filterContainer);
  }

  setEndDate(DateTime endDate) {
    _createIfNotExisting();
    FilterContainer filterContainer = filterContainerBox.getAt(BOX_INDEX)!;
    filterContainer.endDate = endDate;
    filterContainerBox.putAt(BOX_INDEX, filterContainer);
  }

  FilterContainer get() {
   return filterContainerBox.getAt(BOX_INDEX)!;
  }

  _createIfNotExisting() {
    if(filterContainerBox.containsKey(BOX_INDEX)){
      return;
    }
    FilterContainer filterContainer = FilterContainer();
    filterContainer.minDuration = MIN_DURATION_DEFAULT;
    filterContainerBox.put(BOX_INDEX, filterContainer);
  }
}