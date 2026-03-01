import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static final Map<String, HiveManager> _instances = {};
  final String db;
  HiveManager._internal(this.db);
  factory HiveManager(String db) {
    return _instances.putIfAbsent(db, () => HiveManager._internal(db));
  }
  Future<void> _openBoxIfNeeded() async {
    if (!Hive.isBoxOpen(db)) {
      await Hive.openBox(db);
    }
  }

  Future<void> clearAll() async {
    await _openBoxIfNeeded();
    return Hive.box(db).deleteFromDisk();
  }

  Future<void> delete(String key) async {
    await _openBoxIfNeeded();
    return Hive.box(db).delete(key);
  }

  Future<dynamic> read(String key) async {
    await _openBoxIfNeeded();
    return Hive.box(db).get(key);
  }

  Future<void> write(String key, dynamic value) async {
    await _openBoxIfNeeded();
    return Hive.box(db).put(key, value);
  }
}
