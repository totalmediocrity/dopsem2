// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Finance _$FinanceFromJson(Map<String, dynamic> json) {
  return _Finance.fromJson(json);
}

/// @nodoc
mixin _$Finance {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get total => throw _privateConstructorUsedError;
  int? get number => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FinanceCopyWith<Finance> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceCopyWith<$Res> {
  factory $FinanceCopyWith(Finance value, $Res Function(Finance) then) =
      _$FinanceCopyWithImpl<$Res, Finance>;
  @useResult
  $Res call(
      {String name,
      String description,
      String category,
      String total,
      int? number,
      String? status});
}

/// @nodoc
class _$FinanceCopyWithImpl<$Res, $Val extends Finance>
    implements $FinanceCopyWith<$Res> {
  _$FinanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? total = null,
    Object? number = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FinanceCopyWith<$Res> implements $FinanceCopyWith<$Res> {
  factory _$$_FinanceCopyWith(
          _$_Finance value, $Res Function(_$_Finance) then) =
      __$$_FinanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      String category,
      String total,
      int? number,
      String? status});
}

/// @nodoc
class __$$_FinanceCopyWithImpl<$Res>
    extends _$FinanceCopyWithImpl<$Res, _$_Finance>
    implements _$$_FinanceCopyWith<$Res> {
  __$$_FinanceCopyWithImpl(_$_Finance _value, $Res Function(_$_Finance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? category = null,
    Object? total = null,
    Object? number = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Finance(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Finance implements _Finance {
  const _$_Finance(
      {required this.name,
      required this.description,
      required this.category,
      required this.total,
      this.number,
      this.status});

  factory _$_Finance.fromJson(Map<String, dynamic> json) =>
      _$$_FinanceFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final String category;
  @override
  final String total;
  @override
  final int? number;
  @override
  final String? status;

  @override
  String toString() {
    return 'Finance(name: $name, description: $description, category: $category, total: $total, number: $number, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Finance &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, description, category, total, number, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FinanceCopyWith<_$_Finance> get copyWith =>
      __$$_FinanceCopyWithImpl<_$_Finance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FinanceToJson(
      this,
    );
  }
}

abstract class _Finance implements Finance {
  const factory _Finance(
      {required final String name,
      required final String description,
      required final String category,
      required final String total,
      final int? number,
      final String? status}) = _$_Finance;

  factory _Finance.fromJson(Map<String, dynamic> json) = _$_Finance.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  String get category;
  @override
  String get total;
  @override
  int? get number;
  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_FinanceCopyWith<_$_Finance> get copyWith =>
      throw _privateConstructorUsedError;
}
