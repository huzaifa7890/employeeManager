// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:employeemanager/constant/navigation_service.dart';
import 'package:employeemanager/core/repository/firestore_repo.dart';
import 'package:employeemanager/feature/employee/add_employee/repo/add_employee_repo.dart';
import 'package:employeemanager/response/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:employeemanager/models/employee.dart';

final addEditPropertyProvider = NotifierProvider<AddEmployee, AddEmployeeState>(
  () => AddEmployee(firebaseReference: FirebaseReference()),
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
  final FirebaseReference firebaseReference;

  AddEmployee({required this.firebaseReference});

  Future<Response> addProperty({
    required String id,
    required String cnicId,
    required String fullName,
    required String designation,
    required int mobileNo,
    required int pay,
    String? address,
    String? details,
  }) async {
    Employee newEmployee = Employee(
      id: id,
      cnicId: cnicId,
      name: fullName,
      designation: designation,
      phoneNo: mobileNo,
      pay: pay,
      adress: address ?? '',
      createdAt: DateTime.now(),
    );

    final addProperty = [...state.employeeList, newEmployee];
    state = state.copyWith(employeeList: addProperty);
    saveEmployee(newEmployee);
    NavigationService.navigatorKey.currentState?.pop();

    return const Response(isSuccess: true, errorMessage: '');
  }

  Future<Response> saveEmployee(Employee employee) async {
    final employeeRepo = EmployeeFirebaseRepository(firebaseReference);
    final response = await employeeRepo.saveEmployee(employee);
    return Response(isSuccess: true, errorMessage: response.errorMessage);
  }

  @override
  AddEmployeeState build() {
    return AddEmployeeState.initial();
  }
}
