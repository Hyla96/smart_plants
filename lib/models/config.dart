import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable()
class Config {
  const Config(
    this.mongoUri,
  );

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  final String mongoUri;

  Map<String, dynamic> toJson() => _$ConfigToJson(this);

  Config copyWith({
    String? mongoUri,
  }) =>
      Config(
        mongoUri ?? this.mongoUri,
      );

  @override
  String toString() => 'Config: ${toJson()}';
}
