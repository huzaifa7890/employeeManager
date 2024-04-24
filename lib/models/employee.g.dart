// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmployeeImpl _$$EmployeeImplFromJson(Map<String, dynamic> json) =>
    _$EmployeeImpl(
      id: json['id'] as String,
      cnicId: json['cnicId'] as String,
      name: json['name'] as String? ?? '',
      designation: json['designation'] as String? ?? '',
      phoneNo: json['phoneNo'] as int? ?? 0,
      pay: json['pay'] as int? ?? 0,
      adress: json['adress'] as String? ?? '',
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$EmployeeImplToJson(_$EmployeeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cnicId': instance.cnicId,
      'name': instance.name,
      'designation': instance.designation,
      'phoneNo': instance.phoneNo,
      'pay': instance.pay,
      'adress': instance.adress,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
