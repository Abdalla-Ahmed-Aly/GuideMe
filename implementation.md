# Guide Onboarding - Implementation Plan

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   └── api_constants.dart
│   └── services/
│       └── hive_service.dart
│
├── features/
│   └── guide_onboarding/
│       ├── data/
│       │   ├── models/
│       │   │   ├── availability_model.dart
│       │   │   └── guide_onboarding_model.dart
│       │   └── repositories/
│       │       └── guide_onboarding_repository.dart
│       │
│       ├── presentation/
│       │   ├── cubit/
│       │   │   ├── guide_onboarding_cubit.dart
│       │   │   └── guide_onboarding_state.dart
│       │   │
│       │   └── screens/
│       │       ├── guide_professional_info_screen.dart
│       │       ├── guide_expertise_screen.dart
│       │       ├── guide_availability_screen.dart
│       │       └── guide_verification_screen.dart
│       │
│       └── widgets/
│           ├── guide_form_container.dart
│           └── file_picker_widget.dart
│
└── app/
    └── router/
        └── app_router.dart
```

---

## 1️⃣ API Constants

```dart
// lib/core/constants/api_constants.dart

class ApiConstants {
  // Guide Onboarding
  static const String createGuide = '/guide/onboarding';
  static const String updateGuide = '/guide/onboarding';
 // static const String onboardingDetails = '/guide/onboarding/details';
  static const String verificationStatus = '/guide/onboarding/verification-status';
}
```

---

## 2️⃣ Models

### availability_model.dart

```dart
import 'package:hive/hive.dart';

part 'availability_model.g.dart';

@HiveType(typeId: 1)
class AvailabilityModel extends HiveObject {
  @HiveField(0)
  final List<String> days;

  @HiveField(1)
  final String from;

  @HiveField(2)
  final String to;

  AvailabilityModel({
    required this.days,
    required this.from,
    required this.to,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) => AvailabilityModel(
        days: List<String>.from(json['days'] ?? []),
        from: json['from'] ?? '',
        to: json['to'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'days': days,
        'from': from,
        'to': to,
      };

  AvailabilityModel copyWith({
    List<String>? days,
    String? from,
    String? to,
  }) =>
      AvailabilityModel(
        days: days ?? this.days,
        from: from ?? this.from,
        to: to ?? this.to,
      );
}
```

### availability_model.g.dart (Generated)

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_model.dart';

class AvailabilityModelAdapter extends TypeAdapter<AvailabilityModel> {
  @override
  final int typeId = 1;

  @override
  AvailabilityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvailabilityModel(
      days: (fields[0] as List).cast<String>(),
      from: fields[1] as String,
      to: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AvailabilityModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.days)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.to);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailabilityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
```

### guide_onboarding_model.dart

```dart
import 'package:hive/hive.dart';
import 'availability_model.dart';

part 'guide_onboarding_model.g.dart';

@HiveType(typeId: 0)
class GuideOnboardingModel extends HiveObject {
  @HiveField(0)
  final int yearsOfExperience;

  @HiveField(1)
  final List<String> languages;

  @HiveField(2)
  final List<String> expertise;

  @HiveField(3)
  final double hourlyRate;

  @HiveField(4)
  final String currency;

  @HiveField(5)
  final List<String> guideCities;

  @HiveField(6)
  final AvailabilityModel availability;

  @HiveField(7)
  final String? nationalIdFrontPath;

  @HiveField(8)
  final String? nationalIdBackPath;

  @HiveField(9)
  final String? guideLicensePath;

  GuideOnboardingModel({
    required this.yearsOfExperience,
    required this.languages,
    required this.expertise,
    required this.hourlyRate,
    required this.currency,
    required this.guideCities,
    required this.availability,
    this.nationalIdFrontPath,
    this.nationalIdBackPath,
    this.guideLicensePath,
  });

  factory GuideOnboardingModel.fromJson(Map<String, dynamic> json) =>
      GuideOnboardingModel(
        yearsOfExperience: json['yearsOfExperience'] ?? 0,
        languages: List<String>.from(json['languages'] ?? []),
        expertise: List<String>.from(json['expertise'] ?? []),
        hourlyRate: (json['hourlyRate'] ?? 0).toDouble(),
        currency: json['currency'] ?? 'USD',
        guideCities: List<String>.from(json['guideCities'] ?? []),
        availability: AvailabilityModel.fromJson(json['availability'] ?? {}),
        nationalIdFrontPath: json['nationalIdFrontPath'],
        nationalIdBackPath: json['nationalIdBackPath'],
        guideLicensePath: json['guideLicensePath'],
      );

  Map<String, dynamic> toJson() => {
        'yearsOfExperience': yearsOfExperience,
        'languages': languages,
        'expertise': expertise,
        'hourlyRate': hourlyRate,
        'currency': currency,
        'guideCities': guideCities,
        'availability': availability.toJson(),
      };

  GuideOnboardingModel copyWith({
    int? yearsOfExperience,
    List<String>? languages,
    List<String>? expertise,
    double? hourlyRate,
    String? currency,
    List<String>? guideCities,
    AvailabilityModel? availability,
    String? nationalIdFrontPath,
    String? nationalIdBackPath,
    String? guideLicensePath,
  }) =>
      GuideOnboardingModel(
        yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
        languages: languages ?? this.languages,
        expertise: expertise ?? this.expertise,
        hourlyRate: hourlyRate ?? this.hourlyRate,
        currency: currency ?? this.currency,
        guideCities: guideCities ?? this.guideCities,
        availability: availability ?? this.availability,
        nationalIdFrontPath: nationalIdFrontPath ?? this.nationalIdFrontPath,
        nationalIdBackPath: nationalIdBackPath ?? this.nationalIdBackPath,
        guideLicensePath: guideLicensePath ?? this.guideLicensePath,
      );
}
```

### guide_onboarding_model.g.dart (Generated)

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guide_onboarding_model.dart';

class GuideOnboardingModelAdapter extends TypeAdapter<GuideOnboardingModel> {
  @override
  final int typeId = 0;

  @override
  GuideOnboardingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GuideOnboardingModel(
      yearsOfExperience: fields[0] as int,
      languages: (fields[1] as List).cast<String>(),
      expertise: (fields[2] as List).cast<String>(),
      hourlyRate: fields[3] as double,
      currency: fields[4] as String,
      guideCities: (fields[5] as List).cast<String>(),
      availability: fields[6] as AvailabilityModel,
      nationalIdFrontPath: fields[7] as String?,
      nationalIdBackPath: fields[8] as String?,
      guideLicensePath: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GuideOnboardingModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.yearsOfExperience)
      ..writeByte(1)
      ..write(obj.languages)
      ..writeByte(2)
      ..write(obj.expertise)
      ..writeByte(3)
      ..write(obj.hourlyRate)
      ..writeByte(4)
      ..write(obj.currency)
      ..writeByte(5)
      ..write(obj.guideCities)
      ..writeByte(6)
      ..write(obj.availability)
      ..writeByte(7)
      ..write(obj.nationalIdFrontPath)
      ..writeByte(8)
      ..write(obj.nationalIdBackPath)
      ..writeByte(9)
      ..write(obj.guideLicensePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuideOnboardingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
```

---

## 3️⃣ Hive Service

```dart
// lib/core/services/hive_service.dart

import 'package:hive_flutter/hive_flutter.dart';
import '../../features/guide_onboarding/data/models/availability_model.dart';
import '../../features/guide_onboarding/data/models/guide_onboarding_model.dart';

class HiveService {
  static const String guideOnboardingBox = 'guide_onboarding_box';
  static const String guideOnboardingKey = 'guide_onboarding_data';
  static const String onboardingStatusKey = 'onboarding_status';
  static const String isEditModeKey = 'is_edit_mode';

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(AvailabilityModelAdapter());
    Hive.registerAdapter(GuideOnboardingModelAdapter());

    await Hive.openBox(HiveService.guideOnboardingBox);
  }

  static Box get _box => Hive.box(HiveService.guideOnboardingBox);

  // Save Guide Data
  static Future<void> saveGuideData(GuideOnboardingModel data) async {
    await _box.put(guideOnboardingKey, data);
  }

  // Load Guide Data
  static GuideOnboardingModel? loadGuideData() {
    return _box.get(guideOnboardingKey);
  }

  // Clear Guide Data
  static Future<void> clearGuideData() async {
    await _box.delete(guideOnboardingKey);
    await _box.delete(onboardingStatusKey);
    await _box.delete(isEditModeKey);
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
}
```

---

## 4️⃣ Repository

```dart
// lib/features/guide_onboarding/data/repositories/guide_onboarding_repository.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/guide_onboarding_model.dart';

class GuideOnboardingRepository {
  final Dio _dio;

  GuideOnboardingRepository(this._dio);

  /// CREATE - POST with full FormData (files + data)
  Future<Response> createGuide({
    required GuideOnboardingModel data,
    PlatformFile? nationalIdFront,
    PlatformFile? nationalIdBack,
    PlatformFile? guideLicense,
  }) async {
    final formData = FormData.fromMap({
      'yearsOfExperience': data.yearsOfExperience,
      'languages': data.languages,
      'expertise': data.expertise,
      'hourlyRate': data.hourlyRate,
      'currency': data.currency,
      'guideCities': data.guideCities,
      'availability': jsonEncode(data.availability.toJson()),
      if (nationalIdFront != null)
        'nationalIdFront': await MultipartFile.fromFile(
          nationalIdFront.path!,
          filename: nationalIdFront.name,
        ),
      if (nationalIdBack != null)
        'nationalIdBack': await MultipartFile.fromFile(
          nationalIdBack.path!,
          filename: nationalIdBack.name,
        ),
      if (guideLicense != null)
        'guideLicense': await MultipartFile.fromFile(
          guideLicense.path!,
          filename: guideLicense.name,
        ),
    });

    return _dio.post(
      ApiConstants.createGuide,
      data: formData,
    );
  }

  /// UPDATE - PATCH with changed fields only (files + data)
  Future<Response> updateGuide({
    required GuideOnboardingModel data,
    required Map<String, dynamic> changedFields,
    PlatformFile? nationalIdFront,
    PlatformFile? nationalIdBack,
    PlatformFile? guideLicense,
  }) async {
    final formData = FormData.fromMap({
      ...changedFields,
      if (nationalIdFront != null)
        'nationalIdFront': await MultipartFile.fromFile(
          nationalIdFront.path!,
          filename: nationalIdFront.name,
        ),
      if (nationalIdBack != null)
        'nationalIdBack': await MultipartFile.fromFile(
          nationalIdBack.path!,
          filename: nationalIdBack.name,
        ),
      if (guideLicense != null)
        'guideLicense': await MultipartFile.fromFile(
          guideLicense.path!,
          filename: guideLicense.name,
        ),
    });

    return _dio.patch(
      ApiConstants.updateGuide,
      data: formData,
    );
  }

  /// Get Verification Status
  Future<Response> getVerificationStatus() async {
    return _dio.get(ApiConstants.verificationStatus);
  }
}
```

---

## 5️⃣ State

```dart
// lib/features/guide_onboarding/presentation/cubit/guide_onboarding_state.dart

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import '../../data/models/availability_model.dart';
import '../../data/models/guide_onboarding_model.dart';

/// Onboarding Mode
enum OnboardingMode { create, edit }

abstract class GuideOnboardingState extends Equatable {
  const GuideOnboardingState();

  @override
  List<Object?> get props => [];
}

/// Initial State
class GuideOnboardingInitial extends GuideOnboardingState {}

/// Loading State (submitting, fetching, etc.)
class GuideOnboardingLoading extends GuideOnboardingState {}

/// Form Data State (collected from all screens)
class GuideOnboardingFormData extends GuideOnboardingState {
  final GuideOnboardingModel model;
  final PlatformFile? nationalIdFront;
  final PlatformFile? nationalIdBack;
  final PlatformFile? guideLicense;
  final OnboardingMode mode;
  final GuideOnboardingModel? originalData;

  const GuideOnboardingFormData({
    required this.model,
    this.nationalIdFront,
    this.nationalIdBack,
    this.guideLicense,
    this.mode = OnboardingMode.create,
    this.originalData,
  });

  @override
  List<Object?> get props => [
        model,
        nationalIdFront,
        nationalIdBack,
        guideLicense,
        mode,
        originalData,
      ];

  GuideOnboardingFormData copyWith({
    GuideOnboardingModel? model,
    PlatformFile? nationalIdFront,
    PlatformFile? nationalIdBack,
    PlatformFile? guideLicense,
    OnboardingMode? mode,
    GuideOnboardingModel? originalData,
    bool clearNationalIdFront = false,
    bool clearNationalIdBack = false,
    bool clearGuideLicense = false,
  }) {
    return GuideOnboardingFormData(
      model: model ?? this.model,
      nationalIdFront: clearNationalIdFront ? null : (nationalIdFront ?? this.nationalIdFront),
      nationalIdBack: clearNationalIdBack ? null : (nationalIdBack ?? this.nationalIdBack),
      guideLicense: clearGuideLicense ? null : (guideLicense ?? this.guideLicense),
      mode: mode ?? this.mode,
      originalData: originalData ?? this.originalData,
    );
  }

  bool get isEditMode => mode == OnboardingMode.edit;

  bool get hasFiles =>
      nationalIdFront != null ||
      nationalIdBack != null ||
      guideLicense != null;
}

/// Success State
class GuideOnboardingSuccess extends GuideOnboardingState {
  final String status;
  final String? message;

  const GuideOnboardingSuccess({
    required this.status,
    this.message,
  });

  @override
  List<Object?> get props => [status, message];
}

/// Error State
class GuideOnboardingError extends GuideOnboardingState {
  final String message;

  const GuideOnboardingError(this.message);

  @override
  List<Object?> get props => [message];
}
```

---

## 6️⃣ Cubit

```dart
// lib/features/guide_onboarding/presentation/cubit/guide_onboarding_cubit.dart

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/hive_service.dart';
import '../../data/models/availability_model.dart';
import '../../data/models/guide_onboarding_model.dart';
import '../../data/repositories/guide_onboarding_repository.dart';
import 'guide_onboarding_state.dart';

class GuideOnboardingCubit extends Cubit<GuideOnboardingState> {
  final GuideOnboardingRepository _repository;

  GuideOnboardingCubit(this._repository) : super(GuideOnboardingInitial());

  /// Initialize form with default values
  void initForm() {
    final isEditMode = HiveService.loadEditMode();
    final savedData = HiveService.loadGuideData();

    if (isEditMode && savedData != null) {
      emit(GuideOnboardingFormData(
        model: savedData,
        mode: OnboardingMode.edit,
        originalData: savedData,
      ));
    } else {
      emit(GuideOnboardingFormData(
        model: GuideOnboardingModel(
          yearsOfExperience: 0,
          languages: [],
          expertise: [],
          hourlyRate: 0,
          currency: 'USD',
          guideCities: [],
          availability: AvailabilityModel(
            days: [],
            from: '09:00',
            to: '17:00',
          ),
        ),
        mode: OnboardingMode.create,
      ));
    }
  }

  /// Enable Edit Mode (when user is rejected)
  void enableEditMode() {
    final savedData = HiveService.loadGuideData();
    if (savedData != null) {
      HiveService.saveEditMode(true);
      emit(GuideOnboardingFormData(
        model: savedData,
        mode: OnboardingMode.edit,
        originalData: savedData,
      ));
    }
  }

  /// Update Professional Info (Screen 1)
  void setProfessionalInfo({
    int? yearsOfExperience,
    List<String>? languages,
    double? hourlyRate,
    String? currency,
    List<String>? guideCities,
  }) {
    if (state is GuideOnboardingFormData) {
      final current = (state as GuideOnboardingFormData);
      emit(current.copyWith(
        model: current.model.copyWith(
          yearsOfExperience: yearsOfExperience,
          languages: languages,
          hourlyRate: hourlyRate,
          currency: currency,
          guideCities: guideCities,
        ),
      ));
    }
  }

  /// Update Expertise (Screen 2)
  void setExpertise(List<String> expertise) {
    if (state is GuideOnboardingFormData) {
      final current = (state as GuideOnboardingFormData);
      emit(current.copyWith(
        model: current.model.copyWith(expertise: expertise),
      ));
    }
  }

  /// Update Availability (Screen 3)
  void setAvailability({
    List<String>? days,
    String? from,
    String? to,
  }) {
    if (state is GuideOnboardingFormData) {
      final current = (state as GuideOnboardingFormData);
      emit(current.copyWith(
        model: current.model.copyWith(
          availability: current.model.availability.copyWith(
            days: days,
            from: from,
            to: to,
          ),
        ),
      ));
    }
  }

  /// Pick National ID Front
  Future<void> pickNationalIdFront() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null && state is GuideOnboardingFormData) {
      final current = (state as GuideOnboardingFormData);
      emit(current.copyWith(nationalIdFront: result.files.first));
    }
  }

  /// Pick National ID Back
  Future<void> pickNationalIdBack() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null && state is GuideOnboardingFormData) {
      final current = (state as GuideOnboardingFormData);
      emit(current.copyWith(nationalIdBack: result.files.first));
    }
  }

  /// Pick Guide License
  Future<void> pickGuideLicense() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
    );
    if (result != null && state is GuideOnboardingFormData) {
      final current = (state as GuideOnboardingFormData);
      emit(current.copyWith(guideLicense: result.files.first));
    }
  }

  /// Clear specific file
  void clearFile(String fileType) {
    if (state is GuideOnboardingFormData) {
      final current = (state as GuideOnboardingFormData);
      switch (fileType) {
        case 'nationalIdFront':
          emit(current.copyWith(clearNationalIdFront: true));
          break;
        case 'nationalIdBack':
          emit(current.copyWith(clearNationalIdBack: true));
          break;
        case 'guideLicense':
          emit(current.copyWith(clearGuideLicense: true));
          break;
      }
    }
  }

  /// Save current form data to Hive
  Future<void> saveToLocal() async {
    if (state is GuideOnboardingFormData) {
      final current = (state as GuideOnboardingFormData);
      await HiveService.saveGuideData(current.model);
    }
  }

  /// Submit Form (POST or PATCH based on mode)
  Future<void> submitOnboarding() async {
    if (state is! GuideOnboardingFormData) return;

    final current = (state as GuideOnboardingFormData);
    emit(GuideOnboardingLoading());

    try {
      Response response;

      if (current.isEditMode) {
        /// EDIT MODE - PATCH with changed fields
        final changedFields = _getChangedFields(
          current.originalData!,
          current.model,
        );

        if (changedFields.isEmpty && !current.hasFiles) {
          emit(const GuideOnboardingError('No changes to submit'));
          return;
        }

        response = await _repository.updateGuide(
          data: current.model,
          changedFields: changedFields,
          nationalIdFront: current.nationalIdFront,
          nationalIdBack: current.nationalIdBack,
          guideLicense: current.guideLicense,
        );
      } else {
        /// CREATE MODE - POST with full FormData
        response = await _repository.createGuide(
          data: current.model,
          nationalIdFront: current.nationalIdFront,
          nationalIdBack: current.nationalIdBack,
          guideLicense: current.guideLicense,
        );
      }

      // Save status
      final status = response.data['status'] ?? 'pending';
      await HiveService.saveOnboardingStatus(status);

      emit(GuideOnboardingSuccess(
        status: status,
        message: response.data['message'],
      ));
    } catch (e) {
      emit(GuideOnboardingError(_handleError(e)));
    }
  }

  /// Check Verification Status
  Future<void> checkVerificationStatus() async {
    emit(GuideOnboardingLoading());

    try {
      final response = await _repository.getVerificationStatus();
      final status = response.data['status'] ?? 'pending';

      await HiveService.saveOnboardingStatus(status);

      emit(GuideOnboardingSuccess(
        status: status,
        message: response.data['message'],
      ));
    } catch (e) {
      emit(GuideOnboardingError(_handleError(e)));
    }
  }

  /// Get changed fields between original and current model
  Map<String, dynamic> _getChangedFields(
    GuideOnboardingModel original,
    GuideOnboardingModel current,
  ) {
    final Map<String, dynamic> changed = {};

    if (current.yearsOfExperience != original.yearsOfExperience) {
      changed['yearsOfExperience'] = current.yearsOfExperience;
    }

    if (!_listEquals(current.languages, original.languages)) {
      changed['languages'] = current.languages;
    }

    if (!_listEquals(current.expertise, original.expertise)) {
      changed['expertise'] = current.expertise;
    }

    if (current.hourlyRate != original.hourlyRate) {
      changed['hourlyRate'] = current.hourlyRate;
    }

    if (current.currency != original.currency) {
      changed['currency'] = current.currency;
    }

    if (!_listEquals(current.guideCities, original.guideCities)) {
      changed['guideCities'] = current.guideCities;
    }

    if (current.availability.days != original.availability.days ||
        current.availability.from != original.availability.from ||
        current.availability.to != original.availability.to) {
      changed['availability'] = jsonEncode(current.availability.toJson());
    }

    return changed;
  }

  /// Helper to compare lists
  bool _listEquals<T>(List<T> a, List<T> b) {
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  /// Handle error messages
  String _handleError(dynamic error) {
    if (error is DioException) {
      return error.response?.data['message'] ?? error.message ?? 'Unknown error';
    }
    return error.toString();
  }

  /// Reset state
  Future<void> resetOnboarding() async {
    await HiveService.clearGuideData();
    emit(GuideOnboardingInitial());
  }
}
```

---

## 7️⃣ go_router Setup

```dart
// lib/app/router/app_router.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/guide_onboarding/presentation/screens/
    guide_professional_info_screen.dart';
import '../../features/guide_onboarding/presentation/screens/
    guide_expertise_screen.dart';
import '../../features/guide_onboarding/presentation/screens/
    guide_availability_screen.dart';
import '../../features/guide_onboarding/presentation/screens/
    guide_verification_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/guide/onboarding/professional',
    routes: [
      GoRoute(
        path: '/guide/onboarding/professional',
        name: 'guide_professional',
        builder: (context, state) => const GuideProfessionalInfoScreen(),
      ),
      GoRoute(
        path: '/guide/onboarding/expertise',
        name: 'guide_expertise',
        builder: (context, state) => const GuideExpertiseScreen(),
      ),
      GoRoute(
        path: '/guide/onboarding/availability',
        name: 'guide_availability',
        builder: (context, state) => const GuideAvailabilityScreen(),
      ),
      GoRoute(
        path: '/guide/onboarding/verification',
        name: 'guide_verification',
        builder: (context, state) => const GuideVerificationScreen(),
      ),
    ],
  );
}
```

---

## 8️⃣ Screens UI Hints

### Screen 1: Professional Info

```dart
// lib/features/guide_onboarding/presentation/screens/guide_professional_info_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/guide_onboarding_cubit.dart';
import '../cubit/guide_onboarding_state.dart';

class GuideProfessionalInfoScreen extends StatefulWidget {
  const GuideProfessionalInfoScreen({super.key});

  @override
  State<GuideProfessionalInfoScreen> createState() =>
      _GuideProfessionalInfoScreenState();
}

class _GuideProfessionalInfoScreenState
    extends State<GuideProfessionalInfoScreen> {
  late TextEditingController _yearsController;
  late TextEditingController _languagesController;
  late TextEditingController _rateController;
  late TextEditingController _citiesController;
  String _currency = 'USD';

  @override
  void initState() {
    super.initState();
    _yearsController = TextEditingController();
    _languagesController = TextEditingController();
    _rateController = TextEditingController();
    _citiesController = TextEditingController();

    // Pre-fill if edit mode
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preFillIfEditMode();
    });
  }

  void _preFillIfEditMode() {
    final state = context.read<GuideOnboardingCubit>().state;
    if (state is GuideOnboardingFormData && state.isEditMode) {
      _yearsController.text = state.model.yearsOfExperience.toString();
      _languagesController.text = state.model.languages.join(', ');
      _rateController.text = state.model.hourlyRate.toString();
      _citiesController.text = state.model.guideCities.join(', ');
      setState(() => _currency = state.model.currency);
    }
  }

  @override
  void dispose() {
    _yearsController.dispose();
    _languagesController.dispose();
    _rateController.dispose();
    _citiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<GuideOnboardingCubit, GuideOnboardingState>(
          builder: (context, state) {
            if (state is GuideOnboardingFormData && state.isEditMode) {
              return const Text('Edit Professional Info');
            }
            return const Text('Professional Info');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Years of Experience
            TextField(
              controller: _yearsController,
              decoration: const InputDecoration(labelText: 'Years of Experience'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Languages
            TextField(
              controller: _languagesController,
              decoration: const InputDecoration(
                labelText: 'Languages (comma separated)',
                hintText: 'English, Arabic, French',
              ),
            ),
            const SizedBox(height: 16),

            // Hourly Rate
            TextField(
              controller: _rateController,
              decoration: const InputDecoration(labelText: 'Hourly Rate'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),

            // Currency
            DropdownButtonFormField<String>(
              value: _currency,
              decoration: const InputDecoration(labelText: 'Currency'),
              items: const [
                DropdownMenuItem(value: 'USD', child: Text('USD')),
                DropdownMenuItem(value: 'EUR', child: Text('EUR')),
                DropdownMenuItem(value: 'EGP', child: Text('EGP')),
              ],
              onChanged: (val) => setState(() => _currency = val ?? 'USD'),
            ),
            const SizedBox(height: 16),

            // Guide Cities
            TextField(
              controller: _citiesController,
              decoration: const InputDecoration(
                labelText: 'Guide Cities (comma separated)',
                hintText: 'Cairo, Alexandria, Luxor',
              ),
            ),
            const SizedBox(height: 32),

            // Next Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onNext,
                child: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onNext() {
    // Parse values
    final years = int.tryParse(_yearsController.text) ?? 0;
    final languages = _languagesController.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    final rate = double.tryParse(_rateController.text) ?? 0;
    final cities = _citiesController.text
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    // Update Cubit
    context.read<GuideOnboardingCubit>().setProfessionalInfo(
          yearsOfExperience: years,
          languages: languages,
          hourlyRate: rate,
          currency: _currency,
          guideCities: cities,
        );

    // Save to local
    context.read<GuideOnboardingCubit>().saveToLocal();

    // Navigate
    context.push('/guide/onboarding/expertise');
  }
}
```

### Screen 2: Expertise

```dart
// lib/features/guide_onboarding/presentation/screens/guide_expertise_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/guide_onboarding_cubit.dart';
import '../cubit/guide_onboarding_state.dart';

class GuideExpertiseScreen extends StatefulWidget {
  const GuideExpertiseScreen({super.key});

  @override
  State<GuideExpertiseScreen> createState() => _GuideExpertiseScreenState();
}

class _GuideExpertiseScreenState extends State<GuideExpertiseScreen> {
  final _expertiseController = TextEditingController();
  List<String> _selectedExpertise = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preFillIfEditMode();
    });
  }

  void _preFillIfEditMode() {
    final state = context.read<GuideOnboardingCubit>().state;
    if (state is GuideOnboardingFormData) {
      setState(() {
        _selectedExpertise = List.from(state.model.expertise);
        _expertiseController.text = state.model.expertise.join(', ');
      });
    }
  }

  @override
  void dispose() {
    _expertiseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expertise'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select your expertise categories',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Expertise Input
            TextField(
              controller: _expertiseController,
              decoration: const InputDecoration(
                labelText: 'Expertise Category IDs (comma separated)',
                hintText: '64abc123, 64xyz456',
              ),
              onChanged: (val) {
                setState(() {
                  _selectedExpertise = val
                      .split(',')
                      .map((e) => e.trim())
                      .where((e) => e.isNotEmpty)
                      .toList();
                });
              },
            ),
            const SizedBox(height: 8),
            Text(
              'Current: ${_selectedExpertise.length} selected',
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),

            // Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Back'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _onNext,
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onNext() {
    context.read<GuideOnboardingCubit>().setExpertise(_selectedExpertise);
    context.read<GuideOnboardingCubit>().saveToLocal();
    context.push('/guide/onboarding/availability');
  }
}
```

### Screen 3: Availability

```dart
// lib/features/guide_onboarding/presentation/screens/guide_availability_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import '../cubit/guide_onboarding_cubit.dart';
import '../cubit/guide_onboarding_state.dart';

class GuideAvailabilityScreen extends StatefulWidget {
  const GuideAvailabilityScreen({super.key});

  @override
  State<GuideAvailabilityScreen> createState() =>
      _GuideAvailabilityScreenState();
}

class _GuideAvailabilityScreenState extends State<GuideAvailabilityScreen> {
  final List<String> _selectedDays = [];
  TimeOfDay _fromTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _toTime = const TimeOfDay(hour: 17, minute: 0);

  final List<String> _allDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _preFillIfEditMode();
    });
  }

  void _preFillIfEditMode() {
    final state = context.read<GuideOnboardingCubit>().state;
    if (state is GuideOnboardingFormData) {
      setState(() {
        _selectedDays.addAll(state.model.availability.days);
        _fromTime = _parseTime(state.model.availability.from);
        _toTime = _parseTime(state.model.availability.to);
      });
    }
  }

  TimeOfDay _parseTime(String time) {
    final parts = time.split(':');
    return TimeOfDay(
      hour: int.tryParse(parts[0]) ?? 9,
      minute: int.tryParse(parts[1]) ?? 0,
    );
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Availability & Files'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocBuilder<GuideOnboardingCubit, GuideOnboardingState>(
        builder: (context, state) {
          final isEditMode =
              state is GuideOnboardingFormData && state.isEditMode;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Days Selection
                const Text(
                  'Available Days',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: _allDays.map((day) {
                    final isSelected = _selectedDays.contains(day);
                    return FilterChip(
                      label: Text(day),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedDays.add(day);
                          } else {
                            _selectedDays.remove(day);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                // Time Selection
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('From'),
                        subtitle: Text(_formatTime(_fromTime)),
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: _fromTime,
                          );
                          if (time != null) {
                            setState(() => _fromTime = time);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('To'),
                        subtitle: Text(_formatTime(_toTime)),
                        onTap: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: _toTime,
                          );
                          if (time != null) {
                            setState(() => _toTime = time);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // File Uploads
                const Text(
                  'Required Documents',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // National ID Front
                _buildFilePicker(
                  label: 'National ID (Front)',
                  file: state is GuideOnboardingFormData
                      ? state.nationalIdFront
                      : null,
                  onPick: () =>
                      context.read<GuideOnboardingCubit>().pickNationalIdFront(),
                  onClear: () => context
                      .read<GuideOnboardingCubit>()
                      .clearFile('nationalIdFront'),
                ),
                const SizedBox(height: 12),

                // National ID Back
                _buildFilePicker(
                  label: 'National ID (Back)',
                  file: state is GuideOnboardingFormData
                      ? state.nationalIdBack
                      : null,
                  onPick: () =>
                      context.read<GuideOnboardingCubit>().pickNationalIdBack(),
                  onClear: () => context
                      .read<GuideOnboardingCubit>()
                      .clearFile('nationalIdBack'),
                ),
                const SizedBox(height: 12),

                // Guide License
                _buildFilePicker(
                  label: 'Guide License',
                  file: state is GuideOnboardingFormData
                      ? state.guideLicense
                      : null,
                  onPick: () => context
                      .read<GuideOnboardingCubit>()
                      .pickGuideLicense(),
                  onClear: () => context
                      .read<GuideOnboardingCubit>()
                      .clearFile('guideLicense'),
                ),
                const SizedBox(height: 32),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _onSubmit,
                    child: Text(isEditMode ? 'Update' : 'Submit'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilePicker({
    required String label,
    PlatformFile? file,
    required VoidCallback onPick,
    required VoidCallback onClear,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            file != null ? file.name : label,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.attach_file),
          onPressed: onPick,
        ),
        if (file != null)
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: onClear,
          ),
      ],
    );
  }

  void _onSubmit() {
    // Update availability in Cubit
    context.read<GuideOnboardingCubit>().setAvailability(
          days: _selectedDays,
          from: _formatTime(_fromTime),
          to: _formatTime(_toTime),
        );

    // Navigate to verification
    context.push('/guide/onboarding/verification');
  }
}
```

### Screen 4: Verification

```dart
// lib/features/guide_onboarding/presentation/screens/guide_verification_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../cubit/guide_onboarding_cubit.dart';
import '../cubit/guide_onboarding_state.dart';

class GuideVerificationScreen extends StatefulWidget {
  const GuideVerificationScreen({super.key});

  @override
  State<GuideVerificationScreen> createState() =>
      _GuideVerificationScreenState();
}

class _GuideVerificationScreenState extends State<GuideVerificationScreen> {
  @override
  void initState() {
    super.initState();
    // Submit on screen load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GuideOnboardingCubit>().submitOnboarding();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<GuideOnboardingCubit, GuideOnboardingState>(
        listener: (context, state) {
          if (state is GuideOnboardingError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is GuideOnboardingLoading) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Submitting your application...'),
                ],
              ),
            );
          }

          if (state is GuideOnboardingSuccess) {
            return _buildSuccessView(state);
          }

          if (state is GuideOnboardingError) {
            return _buildErrorView(state);
          }

          return const Center(child: Text('Loading...'));
        },
      ),
    );
  }

  Widget _buildSuccessView(GuideOnboardingSuccess state) {
    IconData icon;
    Color color;
    String title;
    String subtitle;
    Widget? action;

    switch (state.status) {
      case 'approved':
        icon = Icons.check_circle;
        color = Colors.green;
        title = 'Approved!';
        subtitle = 'Your guide application has been approved.';
        action = ElevatedButton(
          onPressed: () => context.go('/home'),
          child: const Text('Go to Home'),
        );
        break;
      case 'rejected':
        icon = Icons.cancel;
        color = Colors.red;
        title = 'Rejected';
        subtitle = state.message ?? 'Your application was rejected.';
        action = ElevatedButton(
          onPressed: _onRetry,
          child: const Text('Fix Issues'),
        );
        break;
      default:
        icon = Icons.hourglass_empty;
        color = Colors.orange;
        title = 'Pending';
        subtitle = 'Your application is under review.';
        action = OutlinedButton(
          onPressed: () => context.go('/home'),
          child: const Text('Go to Home'),
        );
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: color),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),
            if (action != null) action,
          ],
        ),
      ),
    );
  }

  Widget _buildErrorView(GuideOnboardingError state) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 80, color: Colors.red),
            const SizedBox(height: 24),
            const Text(
              'Error',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () => context.pop(),
                  child: const Text('Back'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _onRetry,
                  child: const Text('Retry'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onRetry() {
    // Enable edit mode and go back to form
    context.read<GuideOnboardingCubit>().enableEditMode();
    context.go('/guide/onboarding/professional');
  }
}
```

---

## 9️⃣ Navigation Flow

```
┌─────────────────────────────────────────────────────────────────┐
│                        CREATE FLOW                                │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  HomeScreen ──→ "Apply as Guide"                                │
│       │                                                         │
│       ▼                                                         │
│  /guide/onboarding/professional (Screen 1)                      │
│       │                                                         │
│       ▼                                                         │
│  /guide/onboarding/expertise (Screen 2)                         │
│       │                                                         │
│       ▼                                                         │
│  /guide/onboarding/availability (Screen 3)                     │
│       │                                                         │
│       ▼                                                         │
│  /guide/onboarding/verification (Screen 4)                      │
│       │                                                         │
│       ├─── POST /api/guide/onboarding ──→ Backend               │
│       │                                                         │
│       ▼                                                         │
│  ┌─────────────┐                                                │
│  │   STATUS    │                                                │
│  └─────────────┘                                                │
│       │                                                         │
│       ├── approved ──→ Success Screen ──→ Go Home               │
│       ├── pending  ──→ Pending Screen ──→ Go Home               │
│       └── rejected ──→ Failed Screen                            │
│                              │                                  │
└──────────────────────────────┼──────────────────────────────────┘
                               │
                               ▼
┌─────────────────────────────────────────────────────────────────┐
│                        EDIT MODE                                 │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│  FailedScreen ──→ "Fix Issues"                                   │
│       │                                                         │
│       ▼                                                         │
│  enableEditMode() ──→ Save to Hive (isEditMode = true)           │
│       │                                                         │
│       ▼                                                         │
│  Load data from Hive ──→ Pre-fill forms                         │
│       │                                                         │
│       ▼                                                         │
│  /guide/onboarding/professional                                  │
│       │                                                         │
│       ├── Edit text fields                                      │
│       ├── Replace images/files                                  │
│       └── Save changes                                          │
│       │                                                         │
│       ▼                                                         │
│  /guide/onboarding/verification                                  │
│       │                                                         │
│       ├─── PATCH /api/guide/onboarding ──→ Backend              │
│       │    (with changed fields only + new files)               │
│       │                                                         │
│       ▼                                                         │
│  Check status again...                                           │
│                                                                  │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🔟 Data Flow Summary

```
┌────────────────────────────────────────────────────────────────┐
│                     SCREEN 1 (Professional)                     │
│                                                                  │
│  _yearsController ─┐                                           │
│  _languagesController ─┼──► cubit.setProfessionalInfo(...)     │
│  _rateController ──┤       │                                   │
│  _citiesController ┘       │                                   │
│                            ▼                                   │
│                     saveToLocal() ──→ Hive                     │
│                                                                  │
└────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌────────────────────────────────────────────────────────────────┐
│                      SCREEN 2 (Expertise)                       │
│                                                                  │
│  _selectedExpertise ──► cubit.setExpertise(...)                 │
│                            │                                   │
│                            ▼                                   │
│                     saveToLocal() ──→ Hive                     │
│                                                                  │
└────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌────────────────────────────────────────────────────────────────┐
│                    SCREEN 3 (Availability)                      │
│                                                                  │
│  _selectedDays ─┐                                               │
│  _fromTime ─────┼──► cubit.setAvailability(...)                 │
│  _toTime ──────┘                                                │
│                            │                                   │
│  pickNationalIdFront() ──► state.nationalIdFront               │
│  pickNationalIdBack() ───► state.nationalIdBack                │
│  pickGuideLicense() ─────► state.guideLicense                  │
│                            │                                   │
│                            ▼                                   │
│                     submitOnboarding()                          │
│                                                                  │
└────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌────────────────────────────────────────────────────────────────┐
│                     SCREEN 4 (Verification)                     │
│                                                                  │
│  if (isEditMode) ──► PATCH with changed fields                 │
│  else ─────────────► POST with full FormData                  │
│                            │                                   │
│                            ▼                                   │
│                     _getChangedFields() ──► Partial update      │
│                            │                                   │
│                            ▼                                   │
│                     Check status ──► Navigate to result         │
│                                                                  │
└────────────────────────────────────────────────────────────────┘
```

---

## 1️⃣1️⃣ Key Implementation Points

### 1. Hive Boxes Registration (main.dart)

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/hive_service.dart';
import 'core/dio/dio_helper.dart';
import 'features/guide_onboarding/data/repositories/guide_onboarding_repository.dart';
import 'features/guide_onboarding/presentation/cubit/guide_onboarding_cubit.dart';
import 'app/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GuideOnboardingCubit(
        GuideOnboardingRepository(DioHelper.dio),
      ),
      child: MaterialApp.router(
        title: 'GuideMe',
        routerConfig: AppRouter.router,
      ),
    );
  }
}
```

### 2. Dio Helper (basic setup)

```dart
// lib/core/dio/dio_helper.dart

import 'package:dio/dio.dart';

class DioHelper {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:3000/api',
      receiveTimeout: 30000,
      sendTimeout: 30000,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Add auth token here
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
      ),
    );
}
```

### 3. Add Dependencies (pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  
  # Networking
  dio: ^5.4.0
  
  # Local Storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # Navigation
  go_router: ^13.0.0
  
  # File Picker
  file_picker: ^6.1.1

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  hive_generator: ^2.0.1
  build_runner: ^2.4.7
```

### 4. Run Hive Generator

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 1️⃣2️⃣ PATCH Logic Summary

```dart
/// When submitting in EDIT mode:
/// 
/// 1. Compare original data with current data
/// 2. Extract ONLY changed fields
/// 3. Add changed files (if user selected new ones)
/// 4. Send PATCH with FormData containing:
///    - Changed text fields
///    - New files (if any)

Map<String, dynamic> _getChangedFields(original, current) {
  // Returns only fields that are different
  // Example output:
  // {
  //   'hourlyRate': 75,
  //   'languages': ['English', 'Arabic', 'French'],
  //   'availability': '{"days":["Monday"],"from":"08:00","to":"18:00"}'
  // }
}

/// File handling in PATCH:
/// - If user picked new file → include in FormData
/// - If user didn't pick → don't include (backend keeps old)
/// - If user cleared file → separate logic needed (not in MVP)
```

---

## 1️⃣3️⃣ Error Handling

| Error Type | Handling |
|------------|----------|
| Network Error | Show retry button |
| Validation Error | Show field-specific error |
| Server Error | Show generic error with message |
| Timeout | Show retry option |

---

## 1️⃣4️⃣ Testing Checklist

- [ ] Form saves to Hive on each screen
- [ ] Edit mode loads saved data
- [ ] Only changed fields sent in PATCH
- [ ] Files upload correctly in POST
- [ ] Files upload correctly in PATCH
- [ ] Navigation works between screens
- [ ] Verification shows correct status
- [ ] Retry works after error
- [ ] Edit mode flow works after rejection

---

**End of Implementation Plan**
