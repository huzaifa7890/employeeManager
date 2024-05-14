import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee_attendence.freezed.dart';
part 'employee_attendence.g.dart';

@freezed
class EmployeeAttendence with _$EmployeeAttendence {
  const factory EmployeeAttendence({
    @Default('') String status,
    required DateTime dateTime,
  }) = _EmployeeAttendence;
  factory EmployeeAttendence.fromJson(Map<String, dynamic> json) =>
      _$EmployeeAttendenceFromJson(json);
}
