// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Finance _$$_FinanceFromJson(Map<String, dynamic> json) => _$_Finance(
      name: json['name'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      total: json['total'] as String,
      number: json['number'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_FinanceToJson(_$_Finance instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'total': instance.total,
      'number': instance.number,
      'status': instance.status,
    };
