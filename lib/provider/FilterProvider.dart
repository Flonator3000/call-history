import 'package:call_history/service/filter_container_service.dart';
import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  int minDuration = 0; // TODO filterProvider should only include one FilterContainer field
  DateTime? startDate;
  DateTime? endDate;

  final FilterContainerService filterContainerService =
      FilterContainerService();

  FilterProvider() {
    minDuration = filterContainerService.get().minDuration;
    startDate = filterContainerService.get().startDate;
    endDate = filterContainerService.get().endDate;
  }

  setMinDuration(int minDuration) {
    this.minDuration = minDuration;
    filterContainerService.setMinDuration(minDuration);
    notifyListeners();
  }

  setStartDate(DateTime startDate) {
    this.startDate = startDate;
    filterContainerService.setStartDate(startDate);
    notifyListeners();
  }

  setEndDate(DateTime endDate) {
    this.endDate = endDate;
    filterContainerService.setEndDate(endDate);
    notifyListeners();
  }
}
