import 'package:hive/hive.dart';

abstract class BaseRepository<T> {
  Future<void> create(String id, T item);
  Future<T?> read(String id);
  Future<void> update(String id, T item);
  Future<void> delete(String id);
  Future<List<T>> getAll();
}

class HiveRepository<T> implements BaseRepository<T> {
  final String boxName;

  HiveRepository(this.boxName);

  Future<Box<T>> _openBox() async {
    return await Hive.openBox<T>(boxName);
  }

  @override
  Future<void> create(String id, T item) async {
    final box = await _openBox();
    await box.put(id, item);
    await box.close();
    print('Created item with ID: $id');
  }

  @override
  Future<T?> read(String id) async {
    final box = await _openBox();
    final item = box.get(id);
    await box.close();
    return item;
  }

  @override
  Future<void> update(String id, T item) async {
    final box = await _openBox();
    if (box.containsKey(id)) {
      await box.put(id, item);
      print('Updated item with ID: $id');
    } else {
      print('Item not found for ID: $id');
    }
    await box.close();
  }

  @override
  Future<void> delete(String id) async {
    final box = await _openBox();
    if (box.containsKey(id)) {
      await box.delete(id);
      print('Deleted item with ID: $id');
    } else {
      print('Item not found for ID: $id');
    }
    await box.close();
  }

  @override
  Future<List<T>> getAll() async {
    final box = await _openBox();
    final items = box.values.toList();
    await box.close();
    return items;
  }
}
