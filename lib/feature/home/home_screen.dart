import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/feature/auth/providers/auth_provider.dart';
import 'package:employeemanager/feature/drawer/screens/drawer.dart';
import 'package:employeemanager/feature/employee/add_employee/screen/add_employee_screen.dart';
import 'package:employeemanager/feature/employee/add_employee/screen/employee_list.dart';
import 'package:employeemanager/feature/employee/employee_attendence/employee_attendence_screen.dart';
import 'package:employeemanager/theme/app_colors.dart';
import 'package:employeemanager/theme/theme_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final auth = FirebaseAuth.instance;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (auth.currentUser != null) {
        ref
            .read(authProvider.notifier)
            .fetchInvestNetworkUser(auth.currentUser?.uid ?? '');
        ref.read(authProvider.notifier).saveAuthUser(auth.currentUser);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.secondary,
        iconTheme: const IconThemeData(color: AppColors.primary),
        title: Text(
          "Employee Manager",
          style: theme.textTheme.bodyLarge!.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const AddEmployeeScreen();
                  }));
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.amber),
                  child: const Center(child: Text("Add")),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const EmployeeList();
                  }));
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.amber),
                  child: const Center(child: Text("List")),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const EmployeeAttendenceScreen();
                  }));
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.amber),
                  child: const Center(child: Text("Mark Attendence")),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) {
                  //   return const EmployeeList();
                  // }));
                },
                child: Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.amber),
                  child: const Center(child: Text("ListVirere")),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: const ButtonStyle(
              minimumSize: MaterialStatePropertyAll(
                Size(220, 50),
              ),
            ),
            onPressed: () {
              ref.read(authProvider.notifier).signOut();
              context.pushReplacement(AppRoutes.mainScreen);
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
