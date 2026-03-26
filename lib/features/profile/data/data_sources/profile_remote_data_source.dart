import 'package:guide_me/core/constants/api_constants.dart';
import 'package:guide_me/core/network/api_service.dart';
import 'package:guide_me/core/shared/models/user_model.dart';
import 'package:guide_me/features/profile/data/models/update_profile_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> updateProfile(UpdateProfileRequestModel requestModel);
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl(this._apiService);
  final ApiService _apiService;

  @override
  Future<UserModel> updateProfile(
    UpdateProfileRequestModel requestModel,
  ) async {
    final response = await _apiService.patch(
      endpoint: ApiConstants.profile,
      data: await requestModel.toFormData(),
    );
    return UserModel.fromJson(response.data["data"]["user"]);
  }
}
