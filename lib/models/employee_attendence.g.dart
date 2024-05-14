// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_attendence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeAttendenceImpl _$$EmployeeAttendenceImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeAttendenceImpl(
      status: json['status'] as String? ?? '',
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$EmployeeAttendenceImplToJson(
        _$EmployeeAttendenceImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'dateTime': instance.dateTime.toIso8601String(),
    };
