import 'package:employeemanager/feature/auth/providers/auth_provider.dart';
import 'package:employeemanager/feature/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text("Home Screen"),
          ),
          ElevatedButton(
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(
                Size(220, 50),
              ),
            ),
            onPressed: () {
              ref.read(authProvider.notifier).signOut();
              Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) {
                  return const LoginScreen();
                }),
              ));
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
