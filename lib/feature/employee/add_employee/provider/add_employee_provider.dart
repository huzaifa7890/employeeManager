// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:employeemanager/models/employee.dart';

final addEditPropertyProvider = NotifierProvider<AddEmployee, AddEmployeeState>(
  AddEmployee.new,
);

class AddEmployeeState {
  final List<Employee> employeeList;

  AddEmployeeState({required this.employeeList});

  AddEmployeeState copyWith({
    List<Employee>? employeeList,
  }) {
    return AddEmployeeState(
      employeeList: employeeList ?? this.employeeList,
    );
  }

  factory AddEmployeeState.initial() => AddEmployeeState(employeeList: []);
}

class AddEmployee extends Notifier<AddEmployeeState> {
  @override
  AddEmployeeState build() {
    return AddEmployeeState.initial();
  }
}
