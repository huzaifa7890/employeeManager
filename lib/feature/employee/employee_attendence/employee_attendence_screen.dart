import 'package:employeemanager/constant/extension_constants.dart';
import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/feature/employee/add_employee/provider/add_employee_provider.dart';
import 'package:employeemanager/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class EmployeeAttendenceScreen extends ConsumerStatefulWidget {
  const EmployeeAttendenceScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmployeeAttendenceScreenState();
}

class _EmployeeAttendenceScreenState
    extends ConsumerState<EmployeeAttendenceScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(addEmployeeProvider.notifier).fetchAllEmployee();
    });
  }

  @override
  Widget build(BuildContext context) {
    final employeeList = ref.watch(addEmployeeProvider).employeeList;
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "Employee List",
          style: theme.textTheme.bodyLarge,
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("data"),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  DateFormat('dd MMMM y').format(DateTime.now()),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: employeeList.length,
                itemBuilder: (context, index) {
                  final employee = employeeList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.fieldGrey,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 60,
                                    minRadius: 60,
                                    backgroundColor: AppColors.fieldGrey,
                                    child: employee.employeePic!.isNotEmpty
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(51),
                                            child: Image.network(
                                              employee.employeePic!,
                                              height: 70,
                                              width: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : Image.asset(
                                            AssetImages.personIcon,
                                            height: 55,
                                            width: 55,
                                            fit: BoxFit.contain,
                                          ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    employee.name!,
                                    style: theme.textTheme.bodyLarge,
                                  ),
                                  Text(
                                    (employee.designation).toString(),
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                  Text(
                                    (employee.cnicId).toString(),
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}