import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/models/employee.dart';
import 'package:employeemanager/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MarkAttendenceSheet extends ConsumerStatefulWidget {
  final Employee employee;
  const MarkAttendenceSheet({super.key, required this.employee});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MarkAttendenceSheetState();
}

class _MarkAttendenceSheetState extends ConsumerState<MarkAttendenceSheet> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mark Attendence"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
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
                              child: widget.employee.employeePic!.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(51),
                                      child: Image.network(
                                        widget.employee.employeePic!,
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
                            widget.employee.name!,
                            style: theme.textTheme.bodyLarge,
                          ),
                          Text(
                            (widget.employee.designation).toString(),
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            (widget.employee.cnicId).toString(),
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
            const SizedBox(height: 20),
            // Display attendance checkboxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Attendance",
                  style: theme.textTheme.bodyLarge,
                ),
                Wrap(
                  children: [
                    for (var attendance in widget.employee.employeeAttendence)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            value: attendance.present,
                            onChanged: (value) {
                              // Handle checkbox value change
                            },
                          ),
                          Text("Present", style: theme.textTheme.bodyMedium),
                          // Similar lines for other attendance properties
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
