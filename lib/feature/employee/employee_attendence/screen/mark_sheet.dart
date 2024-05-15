import 'package:employeemanager/constant/data_constant.dart';
import 'package:employeemanager/constant/string_constant.dart';
import 'package:employeemanager/feature/employee/employee_attendence/provider/attendence_provider.dart';
import 'package:employeemanager/feature/employee/employee_attendence/widgets/attendence_widget.dart';
import 'package:employeemanager/models/employee.dart';
import 'package:employeemanager/theme/app_colors.dart';
import 'package:employeemanager/widgets/app_text_field.dart';
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
    final selectEmployeeAttendence =
        ref.watch(attendenceProvider).employeeAttendence;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mark Attendence"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
              SizedBox(height: 20),
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Wrap(
                    spacing: 8,
                    children: EmployeeAttendenceStatus.values.map((item) {
                      return AttendenceMarkWidget(
                        text: getEmployeeAttendenceStatus(item),
                        isSelected: selectEmployeeAttendence == item,
                        onPressed: () {
                          ref
                              .read(attendenceProvider.notifier)
                              .setAttendence(item);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              AppTextField(
                height: 65,
                enabled: false,
                hintText: "Basic Pay",

                textAlign: TextAlign.end,
                initialValue: widget.employee.pay.toString(),
                // textController: cnicController,
                fillColor: AppColors.fieldGrey,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Check Basic Pay";
                  }
                  return null;
                },

                hintStyle: theme.textTheme.bodyLarge,
                lines: 1,
              ),
              const SizedBox(height: 10),
              AppTextField(
                height: 65,
                // enabled: false,
                hintText: "Tax/Debit",

                textAlign: TextAlign.end,
                // initialValue: widget.employee.pay.toString(),
                // textController: cnicController,
                fillColor: AppColors.fieldGrey,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Check Tax/Debit";
                  }
                  return null;
                },

                hintStyle: theme.textTheme.bodyLarge,
                lines: 1,
              ),
              const SizedBox(height: 10),
              AppTextField(
                height: 65,
                // enabled: false,
                hintText: "Bonus",

                textAlign: TextAlign.end,
                // initialValue: widget.employee.pay.toString(),
                // textController: cnicController,
                fillColor: AppColors.fieldGrey,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Check Bonus";
                  }
                  return null;
                },

                hintStyle: theme.textTheme.bodyLarge,
                lines: 1,
              ),
              const SizedBox(height: 10),
              AppTextField(
                height: 65,
                // enabled: false,
                hintText: "Total Payments",

                textAlign: TextAlign.end,
                // initialValue: widget.employee.pay.toString(),
                // textController: cnicController,
                fillColor: AppColors.fieldGrey,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Check Total Payments";
                  }
                  return null;
                },

                hintStyle: theme.textTheme.bodyLarge,
                lines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
