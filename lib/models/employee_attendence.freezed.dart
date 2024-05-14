// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_attendence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EmployeeAttendence _$EmployeeAttendenceFromJson(Map<String, dynamic> json) {
  return _EmployeeAttendence.fromJson(json);
}

/// @nodoc
mixin _$EmployeeAttendence {
  String get status => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeAttendenceCopyWith<EmployeeAttendence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeAttendenceCopyWith<$Res> {
  factory $EmployeeAttendenceCopyWith(
          EmployeeAttendence value, $Res Function(EmployeeAttendence) then) =
      _$EmployeeAttendenceCopyWithImpl<$Res, EmployeeAttendence>;
  @useResult
  $Res call({String status, DateTime dateTime});
}

/// @nodoc
class _$EmployeeAttendenceCopyWithImpl<$Res, $Val extends EmployeeAttendence>
    implements $EmployeeAttendenceCopyWith<$Res> {
  _$EmployeeAttendenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dateTime = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmployeeAttendenceImplCopyWith<$Res>
    implements $EmployeeAttendenceCopyWith<$Res> {
  factory _$$EmployeeAttendenceImplCopyWith(_$EmployeeAttendenceImpl value,
          $Res Function(_$EmployeeAttendenceImpl) then) =
      __$$EmployeeAttendenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, DateTime dateTime});
}

/// @nodoc
class __$$EmployeeAttendenceImplCopyWithImpl<$Res>
    extends _$EmployeeAttendenceCopyWithImpl<$Res, _$EmployeeAttendenceImpl>
    implements _$$EmployeeAttendenceImplCopyWith<$Res> {
  __$$EmployeeAttendenceImplCopyWithImpl(_$EmployeeAttendenceImpl _value,
      $Res Function(_$EmployeeAttendenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dateTime = null,
  }) {
    return _then(_$EmployeeAttendenceImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmployeeAttendenceImpl implements _EmployeeAttendence {
  const _$EmployeeAttendenceImpl({this.status = '', required this.dateTime});

  factory _$EmployeeAttendenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$EmployeeAttendenceImplFromJson(json);

  @override
  @JsonKey()
  final String status;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'EmployeeAttendence(status: $status, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmployeeAttendenceImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmployeeAttendenceImplCopyWith<_$EmployeeAttendenceImpl> get copyWith =>
      __$$EmployeeAttendenceImplCopyWithImpl<_$EmployeeAttendenceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EmployeeAttendenceImplToJson(
      this,
    );
  }
}

abstract class _EmployeeAttendence implements EmployeeAttendence {
  const factory _EmployeeAttendence(
      {final String status,
      required final DateTime dateTime}) = _$EmployeeAttendenceImpl;

  factory _EmployeeAttendence.fromJson(Map<String, dynamic> json) =
      _$EmployeeAttendenceImpl.fromJson;

  @override
  String get status;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$EmployeeAttendenceImplCopyWith<_$EmployeeAttendenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
