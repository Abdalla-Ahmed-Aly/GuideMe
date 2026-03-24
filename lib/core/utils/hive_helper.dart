import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/shared/enums/user_role.dart';
import 'package:guide_me/hive_registrar.g.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

class HiveHelper {
  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapters();

    await openBox<UserRole>(name: HiveConstants.userRoleBox);
    await openBox<bool>(name: HiveConstants.avatarBox);
  }

  static Future<Box<T>> openBox<T>({required String name}) async {
    if (Hive.isBoxOpen(name)) {
      return Hive.box<T>(name);
    }
    return await Hive.openBox<T>(name);
  }

  static Box<T> box<T>(String name) {
    return Hive.box<T>(name);
  }

  static Future<void> closeBox({required String name}) async {
    if (Hive.isBoxOpen(name)) {
      await Hive.box(name).close();
    }
  }

  static Future<void> clearBox({required String name}) async {
    if (Hive.isBoxOpen(name)) {
      await Hive.box(name).clear();
    }
  }

  static Future<void> deleteBox({required String name}) async {
    await Hive.deleteBoxFromDisk(name);
  }

  static List<T> getAll<T>({required String name}) {
    return box<T>(name).values.toList();
  }

  static Future<void> addAll<T>({
    required String boxName,
    required List<T> data,
  }) async {
    await box<T>(boxName).addAll(data);
  }

  static Future<void> put<T>({
    required String boxName,
    required dynamic key,
    required T data,
  }) async {
    await box<T>(boxName).put(key, data);
  }

  static T? get<T>({
    required String boxName,
    required dynamic key,
  }) {
    return box<T>(boxName).get(key);
  }

  static Future<void> delete<T>({
    required String boxName,
    required dynamic key,
  }) async {
    await box<T>(boxName).delete(key);
  }

  static Future<void> putAll<T>({
    required String boxName,
    required Map<dynamic, T> data,
  }) async {
    await box<T>(boxName).putAll(data);
  }
}
