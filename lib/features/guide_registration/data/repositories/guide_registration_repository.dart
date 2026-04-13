import 'dart:convert';
import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/guide_registration_model.dart';
import '../../../../core/shared/models/picked_file_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/api_service.dart';

@injectable
class GuideRegistrationRepository {
  final ApiService _apiService;

  GuideRegistrationRepository(this._apiService);

  Future<Response> createGuide({
    required GuideRegistrationModel data,
  }) async {
    final formData = FormData();
    
    // Add simple fields
    formData.fields.add(MapEntry('yearsOfExperience', data.yearsOfExperience.toString()));
    formData.fields.add(MapEntry('hourlyRate', data.hourlyRate.toString()));
    formData.fields.add(MapEntry('currency', data.currency));

    // Arrays: Sending multiple entries with the same key
    for (var lang in data.languages) {
      formData.fields.add(MapEntry('languages', lang));
    }
    for (var exp in data.expertise) {
      formData.fields.add(MapEntry('expertise', exp));
    }
    for (var city in data.guideCities) {
      formData.fields.add(MapEntry('guideCities', city));
    }

    // Availability: Using the exact key required by the server with nested syntax
    for (var day in data.availability.days) {
      formData.fields.add(MapEntry('availability[days][]', day));
    }
    formData.fields.add(MapEntry('availability[from]', data.availability.from));
    formData.fields.add(MapEntry('availability[to]', data.availability.to));

    if (data.profilePhoto != null && data.profilePhoto!.hasPath) {
      formData.files.add(MapEntry(
        'profilePhoto',
        await MultipartFile.fromFile(data.profilePhoto!.path!, filename: data.profilePhoto!.name),
      ));
    }

    if (data.guideLicense != null && data.guideLicense!.hasPath) {
      formData.files.add(MapEntry(
        'guideLicense', 
        await MultipartFile.fromFile(data.guideLicense!.path!, filename: data.guideLicense!.name),
      ));
    }

    if (data.nationalId.isNotEmpty) {
      if (data.nationalId[0] != null && data.nationalId[0]!.hasPath) {
        formData.files.add(MapEntry(
          'nationalIdFront',
          await MultipartFile.fromFile(data.nationalId[0]!.path!, filename: data.nationalId[0]!.name),
        ));
      }
      if (data.nationalId.length > 1 && data.nationalId[1] != null && data.nationalId[1]!.hasPath) {
        formData.files.add(MapEntry(
          'nationalIdBack',
          await MultipartFile.fromFile(data.nationalId[1]!.path!, filename: data.nationalId[1]!.name),
        ));
      }
    }

    // Removed large debug print to prevent log buffer saturation
    return _apiService.post(
      endpoint: ApiConstants.onboarding,
      data: formData,
    );
  }

  Future<Response> updateGuide({
    required Map<String, dynamic> changedFields,
    PickedFileModel? profilePhoto,
    List<PickedFileModel?> nationalId = const [],
    PickedFileModel? guideLicense,
  }) async {
    final formData = FormData();

    changedFields.forEach((key, value) {
      if (key == 'availability' && value is Map) {
         // Consistent with createGuide
         if (value.containsKey('days') && value['days'] is List) {
           for (var d in value['days']) {
             formData.fields.add(MapEntry('availability[days][]', d.toString()));
           }
         }
         if (value.containsKey('from')) {
           formData.fields.add(MapEntry('availability[from]', value['from'].toString()));
         }
         if (value.containsKey('to')) {
           formData.fields.add(MapEntry('availability[to]', value['to'].toString()));
         }
      } else if (value is List) {
        for (var v in value) {
          formData.fields.add(MapEntry(key, v.toString()));
        }
      } else {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    });

    if (profilePhoto != null && profilePhoto.hasPath) {
      formData.files.add(MapEntry(
        'profilePhoto',
        await MultipartFile.fromFile(profilePhoto.path!, filename: profilePhoto.name),
      ));
    }
    if (guideLicense != null && guideLicense.hasPath) {
      formData.files.add(MapEntry(
        'guideLicense',
        await MultipartFile.fromFile(guideLicense.path!, filename: guideLicense.name),
      ));
    }

    if (nationalId.isNotEmpty) {
      if (nationalId[0] != null && nationalId[0]!.hasPath) {
        formData.files.add(MapEntry(
          'nationalIdFront',
          await MultipartFile.fromFile(nationalId[0]!.path!, filename: nationalId[0]!.name),
        ));
      }
      if (nationalId.length > 1 && nationalId[1] != null && nationalId[1]!.hasPath) {
        formData.files.add(MapEntry(
          'nationalIdBack',
          await MultipartFile.fromFile(nationalId[1]!.path!, filename: nationalId[1]!.name),
        ));
      }
    }

    // Removed large debug print to prevent log buffer saturation
    return _apiService.patch(
      endpoint: ApiConstants.onboarding,
      data: formData,
    );
  }

  Future<Response> getVerificationStatus() async {
    return _apiService.get(endpoint: ApiConstants.guideVerificationStatus);
  }

  Future<Response> getOnboardingDetails() async {
    return _apiService.get(endpoint: "${ApiConstants.onboarding}/details");
  }
}
