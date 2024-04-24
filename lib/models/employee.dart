import 'package:freezed_annotation/freezed_annotation.dart';
part 'employee.freezed.dart';
part 'employee.g.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    required String id,
    required String cnicId,
    @Default('') String? name,
    @Default('') String? designation,
    @Default('') String phoneNo,
    @Default('') String pay,
    @Default('') String? adress,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _Employee;
  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);
}
