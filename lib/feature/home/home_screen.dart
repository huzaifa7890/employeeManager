import 'package:employeemanager/feature/auth/providers/auth_provider.dart';
import 'package:employeemanager/feature/auth/screens/login_screen.dart';
import 'package:employeemanager/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   final auth = FirebaseAuth.instance;
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     if (auth.currentUser != null) {
  //       ref
  //           .read(authProvider.notifier)
  //           .fetchInvestNetworkUser(auth.currentUser?.uid ?? '');
  //       ref.read(authProvider.notifier).saveAuthUser(auth.currentUser);

  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: Text(
          "Employee Manager",
          style: theme.textTheme.bodyMedium!.copyWith(
            fontStyle: FontStyle.italic,
            color: AppColors.primary,
          ),
        ),
      ),
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
