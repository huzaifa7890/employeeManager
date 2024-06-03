import 'package:employeemanager/core/provider/shared_preference_provider.dart';
import 'package:employeemanager/core/provider/theme_provider.dart';
import 'package:employeemanager/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyApp extends ConsumerWidget {
  final GoRouter router;
  final bool isDev;
  const MyApp({
    super.key,
    required this.router,
    required this.isDev,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    ref.read(sharedPrefsProvider).setBool('isDev', isDev);
    return MaterialApp.router(
      debugShowCheckedModeBanner: isDev ? true : false,
      title: 'Employee Manager',
      theme: themeMode == ThemeMode.light
          ? AppTheme.lightThemeCopy
          : AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ref.read(themeModeProvider),
      routerConfig: router,
    );
  }
}
