// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:employeemanager/constant/navigation_service.dart';
import 'package:employeemanager/core/repository/firestore_repo.dart';
import 'package:employeemanager/feature/auth/repository/firestorage_repo.dart';
import 'package:employeemanager/feature/employee/add_employee/provider/employee_provider.dart';
import 'package:employeemanager/feature/employee/add_employee/repo/add_employee_repo.dart';
import 'package:employeemanager/response/firebase_response/firebase_response_model.dart';
import 'package:employeemanager/response/response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:employeemanager/models/employee.dart';

final addEmployeeProvider = NotifierProvider<AddEmployee, AddEmployeeState>(
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

  Future<Response> addEmployee({
    required String id,
    required String userId,
    required String cnicId,
    required String fullName,
    required String designation,
    required int mobileNo,
    required int pay,
    String? address,
    String? details,
    File? selectedImage,
  }) async {
    FirebaseResponse<String> firebaseresponse =
        const FirebaseResponse(errorMessage: '');

    if (selectedImage != null) {
      final firebase = FireStorageRepo();
      firebaseresponse =
          await firebase.uploadImage(selectedImage, "images/employee/$id");
    }
    Employee newEmployee = Employee(
      id: id,
      userId: userId,
      cnicId: cnicId,
      name: fullName,
      designation: designation,
      phoneNo: mobileNo,
      pay: pay,
      adress: address ?? '',
      employeePic: firebaseresponse.data,
      createdAt: DateTime.now(),
    );

    final addProperty = [...state.employeeList, newEmployee];
    state = state.copyWith(employeeList: addProperty);
    ref.read(employeeProvider.notifier).state = newEmployee;
    return const Response(isSuccess: true, errorMessage: '');
  }

  Future<Response> saveEmployee() async {
    final employeeRepo = EmployeeFirebaseRepository(firebaseReference);
    final employee = ref.read(employeeProvider);
    final response = await employeeRepo.saveEmployee(employee!);
    NavigationService.navigatorKey.currentState?.pop();
    return Response(isSuccess: true, errorMessage: response.errorMessage);
  }

  @override
  AddEmployeeState build() {
    return AddEmployeeState.initial();
  }
}
