import 'package:employeemanager/firebase_options.dart';
import 'package:employeemanager/main.dart';
import 'package:employeemanager/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final router = AppRouter().router;
  runApp(ProviderScope(
      child: MyApp(
    router: router,
    isDev: false,
  )));
}
