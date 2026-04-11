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

    // Add lists as repeated keys with [] to ensure Multer/Joi recognition as array
    for (var lang in data.languages) {
      formData.fields.add(MapEntry('languages[]', lang));
    }
    for (var exp in data.expertise) {
      formData.fields.add(MapEntry('expertise[]', exp));
    }
    for (var city in data.guideCities) {
      formData.fields.add(MapEntry('guideCities[]', city));
    }

    // Add availability as flattened nested fields
    final availabilityMap = data.availability.toJson();
    availabilityMap.forEach((key, value) {
      if (value is List) {
        for (var v in value) {
          formData.fields.add(MapEntry('availability[$key][]', v.toString()));
        }
      } else {
        formData.fields.add(MapEntry('availability[$key]', value.toString()));
      }
    });

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

    // Handling specific ID keys from Postman
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

    print("SENDING ONBOARDING RAW FORMDATA FIELDS: ${formData.fields}");

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
      if (value is List) {
        for (var v in value) {
          formData.fields.add(MapEntry('$key[]', v.toString()));
        }
      } else if (value is Map) {
        value.forEach((subKey, subValue) {
          if (subValue is List) {
            for (var v in subValue) {
              formData.fields.add(MapEntry('$key[$subKey][]', v.toString()));
            }
          } else {
            formData.fields.add(MapEntry('$key[$subKey]', subValue.toString()));
          }
        });
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

    print("UPDATING ONBOARDING RAW FORMDATA FIELDS: ${formData.fields}");

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
