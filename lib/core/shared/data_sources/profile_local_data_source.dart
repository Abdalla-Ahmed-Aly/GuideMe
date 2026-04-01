import 'dart:convert';
import 'package:guide_me/core/constants/hive_constants.dart';
import 'package:guide_me/core/shared/models/user_model.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileLocalDataSource {
  UserModel? getCachedUser();
  Future<void> cacheUser(UserModel model);
  Future<void> clearUser();
}

@LazySingleton(as: ProfileLocalDataSource)
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  @override
  UserModel? getCachedUser() {
    final json = HiveHelper.get<String>(
      boxName: HiveConstants.userBox,
      key: HiveConstants.userKey,
    );
    if (json == null) return null;
    return UserModel.fromJson(jsonDecode(json));
  }

  @override
  Future<void> cacheUser(UserModel model) async {
    await HiveHelper.put<String>(
      boxName: HiveConstants.userBox,
      key: HiveConstants.userKey,
      data: jsonEncode(model.toJson()),
    );
  }

  @override
  Future<void> clearUser() async {
    await HiveHelper.delete<String>(
      boxName: HiveConstants.userBox,
      key: HiveConstants.userKey,
    );
  }
}
