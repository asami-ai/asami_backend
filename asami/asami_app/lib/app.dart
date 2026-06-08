import 'package:common_designs/common_designs.dart';
import 'package:flutter/material.dart';
import 'core/di/injection_container.dart';
import 'core/router/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // title: 'asami_app',
      themeMode: ThemeMode.system,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      // routerConfig: getIt<AppRouter>().router,
      debugShowCheckedModeBanner: false,
    );
  }
}
