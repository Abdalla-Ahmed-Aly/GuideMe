import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/core/shared/models/user_model.dart';
import 'package:guide_me/features/guide_profile/data/models/add_certification_model.dart';
import 'package:injectable/injectable.dart';
import 'package:guide_me/features/guide_profile/data/data_sources/remote/guide_profile_remote_data_source.dart';

@LazySingleton(as: GuideProfileRemoteDataSource)
class GuideProfileRemoteDataSourceImpl implements GuideProfileRemoteDataSource {
  final ApiService _apiService;
  GuideProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<UserModel> getGuideProfile(String userId) async {
    final response = await _apiService.get(
      endpoint: "${ApiConstants.userProfileEndpoint}/$userId",
    );
    return UserModel.fromJson(response.data['data']);
  }

  @override
  Future<void> updateGuideBio(String bio) async {
    final data = FormData.fromMap({"bio": bio});
    await _apiService.patch(
      endpoint: ApiConstants.guideProfile,
      data: data,
    );
  }

  @override
  Future<void> updateGuideLanguages(List<String> languages) async {
    final data = FormData.fromMap({"languages": jsonEncode(languages)});
    await _apiService.patch(
      endpoint: ApiConstants.guideProfile,
      data: data,
    );
  }

  @override
  Future<void> addGuideCertification(
    AddCertificationModel certification,
  ) async {
    final data = await certification.toFormData();
    await _apiService.post(
      endpoint: ApiConstants.guideCertificates,
      data: data,
    );
  }

  @override
  Future<void> deleteGuideCertification(String certificationId) async {
    await _apiService.delete(
      endpoint: "${ApiConstants.guideCertificates}/$certificationId",
    );
  }
}
