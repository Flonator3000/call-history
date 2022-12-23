import 'package:call_history/service/call_log_service.dart';
import 'package:call_history/service/filter_container_persistence_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  FilterContainerPersistenceService getFilterContainerPersistenceService() => FilterContainerPersistenceService();

  CallLogService getCallLogService() => CallLogService();
}
