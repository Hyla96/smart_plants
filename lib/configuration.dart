import 'dart:io';

import 'package:smart_plants/models/config.dart';
import 'package:yaml/yaml.dart';

class Configuration {
  const Configuration(this.config);

  final Config config;

  static Future<Configuration> create() async {
    final doc = await File("config.yaml").readAsString();
    final yaml = loadYaml(doc) as YamlMap;
    return Configuration(Config.fromJson(Map.from(yaml.value)));
  }
}
