import 'package:asami_client/asami_client.dart';
import 'package:common_utils2/common_utils2.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'injection_container.config.dart';

/// Dependency injection setup
/// Add your dependency injection configuration here
final getIt = GetIt.instance;

@InjectableInit(
    initializerName: 'init', preferRelativeImports: true, asExtension: true)
Future<void> initDependencies() async {
  _initClient();
  await _initUtilities();
  await getIt.init();
}

void _initClient() {
  // When you are running the app on a physical device, you need to set the
  // server URL to the IP address of your computer. You can find the IP
  // address by running `ipconfig` on Windows or `ifconfig` on Mac/Linux.
  // You can set the variable when running or building your app like this:
  // E.g. `flutter run --dart-define=SERVER_URL=https://api.example.com/`

  const serverUrlFromEnv = String.fromEnvironment('SERVER_URL');
  final serverUrl =
      serverUrlFromEnv.isEmpty ? 'http://10.207.3.188:8080/' : serverUrlFromEnv;

  final client = Client(serverUrl)
    ..connectivityMonitor = FlutterConnectivityMonitor();

  getIt.registerSingleton(client);
}

Future<void> _initUtilities() async {
  LoggerService.init();

  await StorageService.init();
  await DeviceInfoHelper.init();
  await NetworkConnectivity.init(onConnectivityChanged: (isConnected) {
    LoggerService.instance.debug("Network connectivity changed: $isConnected");
  });
}
