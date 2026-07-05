import 'package:dio/dio.dart';
import '../../../../core/constants/api_constants.dart';
import '../models/guide_registration_model.dart';
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

    // Array fields with [] suffix to force Joi to see them as an Array
    for (var lang in data.languages) {
      formData.fields.add(MapEntry('languages[]', lang));
    }
    for (var exp in data.expertise) {
      formData.fields.add(MapEntry('expertise[]', exp));
    }
    for (var city in data.guideCities) {
      formData.fields.add(MapEntry('guideCities[]', city));
    }

    // Availability: Object syntax (This format passed in the last attempt)
    for (var day in data.availability.days) {
      formData.fields.add(MapEntry('availability[days][]', day));
    }
    formData.fields.add(MapEntry('availability[from]', data.availability.from));
    formData.fields.add(MapEntry('availability[to]', data.availability.to));

    // Files
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

    return _apiService.post(
      endpoint: ApiConstants.onboarding,
      data: formData,
    );
  }

  Future<Response> updateGuide({
    required GuideRegistrationModel data,
  }) async {
    final formData = FormData();

    formData.fields.add(MapEntry('yearsOfExperience', data.yearsOfExperience.toString()));
    formData.fields.add(MapEntry('hourlyRate', data.hourlyRate.toString()));
    formData.fields.add(MapEntry('currency', data.currency));

    for (var lang in data.languages) {
      formData.fields.add(MapEntry('languages[]', lang));
    }
    for (var exp in data.expertise) {
      formData.fields.add(MapEntry('expertise[]', exp));
    }
    for (var city in data.guideCities) {
      formData.fields.add(MapEntry('guideCities[]', city));
    }

    for (var day in data.availability.days) {
      formData.fields.add(MapEntry('availability[days][]', day));
    }
    formData.fields.add(MapEntry('availability[from]', data.availability.from));
    formData.fields.add(MapEntry('availability[to]', data.availability.to));

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
