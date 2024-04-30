// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:employeemanager/constant/navigation_service.dart';
import 'package:employeemanager/core/repository/firestore_repo.dart';
import 'package:employeemanager/feature/auth/providers/user_provider.dart';
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
  final bool isLoading;
  final String? errorMessage;

  AddEmployeeState({
    required this.employeeList,
    required this.errorMessage,
    required this.isLoading,
  });

  AddEmployeeState copyWith({
    List<Employee>? employeeList,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AddEmployeeState(
      employeeList: employeeList ?? this.employeeList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  factory AddEmployeeState.initial() => AddEmployeeState(
        employeeList: [],
        isLoading: false,
        errorMessage: '',
      );
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
    NavigationService.navigatorKey.currentState?.pop();
    ref.read(employeeProvider.notifier).state = newEmployee;
    return const Response(isSuccess: true, errorMessage: '');
  }

  Future<Response> saveEmployee() async {
    final employeeRepo = EmployeeFirebaseRepository(firebaseReference);
    final employee = ref.read(employeeProvider);
    final response = await employeeRepo.saveEmployee(employee!);
    return Response(isSuccess: true, errorMessage: response.errorMessage);
  }

  Future<FirebaseResponse<List<Employee>>> fetchAllEmployee() async {
    final userId = ref.read(userProvider)?.id ?? '';
    final employeeRepo = EmployeeFirebaseRepository(firebaseReference);
    final response = await employeeRepo.fetchAllEmployees(userId);
    state = state.copyWith(
        isLoading: false, errorMessage: null, employeeList: response.data);
    return FirebaseResponse(
      data: response.data,
      errorMessage: response.errorMessage,
    );
  }

  @override
  AddEmployeeState build() {
    return AddEmployeeState.initial();
  }
}
