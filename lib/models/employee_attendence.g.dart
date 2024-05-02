// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_attendence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeAttendenceImpl _$$EmployeeAttendenceImplFromJson(
        Map<String, dynamic> json) =>
    _$EmployeeAttendenceImpl(
      present: json['present'] as bool? ?? false,
      absent: json['absent'] as bool? ?? false,
      halfDay: json['halfDay'] as bool? ?? false,
      double: json['double'] as bool? ?? false,
      overTime: json['overTime'] as bool? ?? false,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$EmployeeAttendenceImplToJson(
        _$EmployeeAttendenceImpl instance) =>
    <String, dynamic>{
      'present': instance.present,
      'absent': instance.absent,
      'halfDay': instance.halfDay,
      'double': instance.double,
      'overTime': instance.overTime,
      'dateTime': instance.dateTime.toIso8601String(),
    };
