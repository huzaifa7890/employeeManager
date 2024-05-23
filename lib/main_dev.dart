import 'package:employeemanager/core/provider/shared_preference_provider.dart';
import 'package:employeemanager/firebase_options.dart';
import 'package:employeemanager/main.dart';
import 'package:employeemanager/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final router = AppRouter().router;
  final sharedPrefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(sharedPrefs),
      ],
      child: MyApp(
        router: router,
        isDev: true,
      )));
}
