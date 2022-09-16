import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable()
class Report {
  const Report(
    this.id,
    this.humidity,
    this.date,
  );

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  final double humidity;
  final String id;
  final int date;

  Map<String, dynamic> toJson() => _$ReportToJson(this);

  Report copyWith({
    double? humidity,
    String? id,
    int? date,
  }) =>
      Report(
        id ?? this.id,
        humidity ?? this.humidity,
        date ?? this.date,
      );

  @override
  String toString() => 'Report: ${toJson()}';
}
