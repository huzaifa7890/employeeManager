import 'package:employeemanager/constant/extension_constants.dart';
import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/feature/employee/add_employee/provider/add_employee_provider.dart';
import 'package:employeemanager/feature/employee/employee_attendence/screen/mark_sheet.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Date",
                style: theme.textTheme.bodyLarge,
              ),
              Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    DateFormat('dd MMMM y').format(DateTime.now()),
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: employeeList.length,
                itemBuilder: (context, index) {
                  final employee = employeeList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return MarkAttendenceSheet(employee: employee);
                      }));
                    },
                    child: Padding(
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
                                    Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(60),
                                        border: Border.all(
                                          color: Colors.blue,
                                          width:
                                              4, // Adjust this value to your preference
                                        ),
                                      ),
                                      child: CircleAvatar(
                                        maxRadius: 60,
                                        minRadius: 60,
                                        backgroundColor: AppColors.fieldGrey,
                                        child: employee.employeePic!.isNotEmpty
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(51),
                                                child: Image.network(
                                                  employee.employeePic!,
                                                  height: 100,
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
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
