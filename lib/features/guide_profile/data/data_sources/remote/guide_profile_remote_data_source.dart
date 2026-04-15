import 'package:guide_me/core/shared/models/user_model.dart';
import 'package:guide_me/features/guide_profile/data/models/add_certification_model.dart';

abstract class GuideProfileRemoteDataSource {
  Future<UserModel> getGuideProfile(String userId);
  Future<void> updateGuideBio(String bio);
  Future<void> updateGuideLanguages(List<String> languages);
  Future<void> addGuideCertification(AddCertificationModel certification);
  Future<void> deleteGuideCertification(String certificationId);
}
