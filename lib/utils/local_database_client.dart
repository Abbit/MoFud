import 'package:hive/hive.dart';

class LocalDatabaseClient<T> {
  final String _dbName;
  Box<T> _box;
  TypeAdapter<T> _adapter;

  LocalDatabaseClient(this._dbName, this._adapter);

  Future<void> init() async {
    Hive.registerAdapter(_adapter);

    _box = await Hive.openBox<T>(_dbName);
  }

  Future<void> put(String key, T value) async {
    await _box.put(key, value);
  }

  Future<void> delete(String key) async {
    await _box.delete(key);
  }

  Future<void> update(String key, T newValue) async {
    await _box.put(key, newValue);
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

  Future<void> deleteAll() async {
    await _box.clear();
  }
}
