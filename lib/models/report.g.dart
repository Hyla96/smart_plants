// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      json['id'] as String,
      (json['humidity'] as num).toDouble(),
      json['date'] as int,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'humidity': instance.humidity,
      'id': instance.id,
      'date': instance.date,
    };
