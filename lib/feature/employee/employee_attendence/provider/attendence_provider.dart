import 'package:employeemanager/models/employee.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendenceState {
  EmployeeAttendenceStatus? employeeAttendence;

  AttendenceState({required this.employeeAttendence});
  factory AttendenceState.initial() =>
      AttendenceState(employeeAttendence: null);

  AttendenceState copyWith({
    EmployeeAttendenceStatus? employeeAttendence,
  }) {
    return AttendenceState(
      employeeAttendence: employeeAttendence ?? this.employeeAttendence,
    );
  }
}

class AttendenceProvider extends Notifier<AttendenceState> {
  void setAttendence(EmployeeAttendenceStatus employeeAttendence) {
    state = state.copyWith(employeeAttendence: employeeAttendence);
  }

  @override
  AttendenceState build() {
    return AttendenceState.initial();
  }
}

final attendenceProvider =
    NotifierProvider<AttendenceProvider, AttendenceState>(
        () => AttendenceProvider());
