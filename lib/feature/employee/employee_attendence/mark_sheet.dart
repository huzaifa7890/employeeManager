import 'package:employeemanager/models/employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    return Scaffold(
      body: Center(
        child: Text(widget.employee.pay.toString()),
      ),
    );
  }
}
