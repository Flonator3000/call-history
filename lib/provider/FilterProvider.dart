import 'package:call_history/service/filter_container_service.dart';
import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  int minDuration = 0;
  final FilterContainerService filterContainerService =
      FilterContainerService();

  FilterProvider() {
    minDuration = filterContainerService.get().minDuration;
  }

  setMinDuration(int minDuration) {
    this.minDuration = minDuration;
    filterContainerService.setMinDuration(minDuration);
    notifyListeners();
  }
}
