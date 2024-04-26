import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    required String id,
    required String userId,
    required String cnicId,
    @Default('') String? name,
    @Default('') String? designation,
    @Default(0) int phoneNo,
    @Default(0) int pay,
    @Default('') String? adress,
    @Default('') String? employeePic,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Employee;
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
