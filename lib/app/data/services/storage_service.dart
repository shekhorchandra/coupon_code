import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;

  StorageService._internal();

  final GetStorage _box = GetStorage();

  // Initialize the storage
  Future<void> init() async {
    final status = await _box.initStorage;

    if (status) {
      log('Get Storage Box Initialized');
    } else {
      log('Failed to initialize Get Storage');
    }
  }

  // Read data
  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  // Read data
  Future<void> write<T>(String key, T value) async {
    return _box.write(key, value);
  }

  // Remove data by key
  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  // Clear all stored data
  Future<void> clear() async {
    await _box.erase();
  }
}
