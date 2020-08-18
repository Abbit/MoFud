import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseClient<T> {
  final String _dbName;
  Box<T> _box;
  TypeAdapter<T> _adapter;

  LocalDatabaseClient(this._dbName, this._adapter);

  Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(_adapter);

    _box = await Hive.openBox<T>(_dbName);
  }

  Future<void> put(String key, T value) async {
    _box.put(key, value);
  }

  Future<void> delete(String key) async {
    _box.delete(key);
  }

  Future<T> get(String key) async {
    return _box.get(key);
  }

  Future<bool> isContains(String key) async {
    return _box.containsKey(key);
  }

  Future<List<T>> getAll() async {
    return List<T>.from(_box.values);
  }
}
