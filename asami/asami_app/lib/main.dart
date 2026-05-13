import 'package:asami_app/core/di/injection_container.dart';
import 'package:asami_app/core/state_management/bloc_listeners.dart';
import 'package:asami_app/core/state_management/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

late String serverUrl;

void main() async {
  // Ensure that widgets are initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize dependencies
  await initDependencies();

  // Run app
  runApp(
    MultiBlocProvider(
      providers: AllBlocProviders.blocProviders,
      child: MultiBlocListener(
        listeners: AllBlocListeners.blocListeners,
        child: const MyApp(),
      ),
    ),
  );
}
