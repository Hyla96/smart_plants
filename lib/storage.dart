import 'package:mongo_dart/mongo_dart.dart';
import 'package:smart_plants/configuration.dart';

class Storage {
  const Storage(this.db);

  final Db db;

  DbCollection get reportCollection => db.collection('reports');

  static Future<Storage> create(Configuration config) async {
    final db = await Db.create(config.config.mongoUri);
    await db.open();
    return Storage(db);
  }
}
