
import 'package:call_history/service/filter_container_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  FilterContainerService getService() => FilterContainerService();
}