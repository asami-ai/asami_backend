import 'package:common_utils2/common_utils2.dart';
import 'package:injectable/injectable.dart';

@module
abstract class UtilityModules {
  @lazySingleton
  LoggerService get loggerService => LoggerService.instance;

  @lazySingleton
  StorageService get storageService => StorageService.instance;

  @lazySingleton
  DeviceInfoHelper get deviceInfoHelper => DeviceInfoHelper.instance;

  @lazySingleton
  NetworkConnectivity get networkConnectivity => NetworkConnectivity.instance;
}
