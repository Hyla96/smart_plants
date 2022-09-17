import 'dart:io';

import 'package:path/path.dart';
import 'package:smart_plants/models/config.dart';
import 'package:yaml/yaml.dart';

class Configuration {
  const Configuration(this.config);

  final Config config;

  static Future<Configuration> create() async {
    final filePath = join(Directory.current.path, 'config.yaml');

    final doc = await File(filePath).readAsString();
    final yaml = loadYaml(doc) as YamlMap;
    return Configuration(Config.fromJson(Map.from(yaml.value)));
  }
}
