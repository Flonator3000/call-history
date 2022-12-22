import 'package:call_history/core/configure_dependencies.dart';
import 'package:call_history/model/filter_container.dart';
import 'package:call_history/service/filter_container_persistence_service.dart';
import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  late FilterContainer filterContainer;

  final FilterContainerPersistenceService filterContainerService = getIt<FilterContainerPersistenceService>();

  FilterProvider() {
    filterContainer = filterContainerService.get();
  }

  update(FilterContainer filterContainer) {
    filterContainerService.update(filterContainer);
    notifyListeners();
  }
}
