import 'package:call_history/service/filter_container_persistence_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  FilterContainerPersistenceService getService() => FilterContainerPersistenceService();
}
