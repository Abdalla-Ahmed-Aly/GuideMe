import 'package:guide_me/core/constants/hive_constants.dart' show HiveConstants;
import 'package:guide_me/core/shared/models/picked_file_model.dart';
import 'package:guide_me/core/utils/hive_helper.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import '../../features/guide_registration/data/models/availability_model.dart';
import '../../features/guide_registration/data/models/guide_registration_model.dart';

import 'package:guide_me/core/shared/enums/user_role.dart';

class HiveService {
  static const String guideRegistrationBox = 'guide_registration_box';
  static const String guideRegistrationKey = 'guide_registration_data';
  static const String onboardingStatusKey = 'onboarding_status';
  static const String isEditModeKey = 'is_edit_mode';
  static const String userRoleKey = 'user_role';
  static const String hasSeenSuccessKey = 'has_seen_success';

  static Future<void> init() async {
    // Register Adapters
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(UserRoleAdapter());
    }
    if (!Hive.isAdapterRegistered(11)) {
      Hive.registerAdapter(AvailabilityModelAdapter());
    }
    if (!Hive.isAdapterRegistered(12)) {
      Hive.registerAdapter(GuideRegistrationModelAdapter());
    }
    if (!Hive.isAdapterRegistered(13)) {
      Hive.registerAdapter(PickedFileModelAdapter());
    }

    await Hive.openBox(guideRegistrationBox);
  }

  static Box get _box {
    if (!Hive.isBoxOpen(guideRegistrationBox)) {
      throw StateError('Hive box "$guideRegistrationBox" is not open. Call HiveService.init() first.');
    }
    return Hive.box(guideRegistrationBox);
  }

  // Save Guide Data
  static Future<void> saveGuideData(GuideRegistrationModel data) async {
    await _box.put(guideRegistrationKey, data);
  }

  // Load Guide Data
  static GuideRegistrationModel? loadGuideData() {
    return _box.get(guideRegistrationKey);
  }

  // Clear Guide Data
  static Future<void> clearGuideData() async {
    await _box.delete(guideRegistrationKey);
    await _box.delete(onboardingStatusKey);
    await _box.delete(isEditModeKey);
    await _box.delete(userRoleKey);
    await _box.delete(hasSeenSuccessKey);
  }

  // Save User Role
  static Future<void> saveUserRole(UserRole role) async {
    await HiveHelper.put<UserRole>(
      boxName: HiveConstants.userRoleBox,
      key: HiveConstants.userRoleKey,
      data: role,
    );
  }

  // Load User Role
  static UserRole? loadUserRole() {
    return HiveHelper.get<UserRole>(
      boxName: HiveConstants.userRoleBox,
      key: HiveConstants.userRoleKey,
    );
  }

  // Save Onboarding Status (pending, approved, rejected)
  static Future<void> saveOnboardingStatus(String status) async {
    await _box.put(onboardingStatusKey, status);
  }

  // Load Onboarding Status
  static String? loadOnboardingStatus() {
    return _box.get(onboardingStatusKey);
  }

  // Save Edit Mode Flag
  static Future<void> saveEditMode(bool isEdit) async {
    await _box.put(isEditModeKey, isEdit);
  }

  // Load Edit Mode Flag
  static bool loadEditMode() {
    return _box.get(isEditModeKey, defaultValue: false);
  }

  // Save Success Seen Flag
  static Future<void> saveSuccessSeen(bool seen) async {
    await _box.put(hasSeenSuccessKey, seen);
  }

  // Load Success Seen Flag
  static bool hasSeenSuccess() {
    return _box.get(hasSeenSuccessKey, defaultValue: false);
  }
}
