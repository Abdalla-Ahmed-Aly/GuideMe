import 'package:guide_me/core/shared/models/certificate_model.dart';
import 'package:guide_me/core/shared/entities/certificate_entity.dart';

class CertificateMapper {
  static CertificateEntity toEntity(CertificateModel model) {
    return CertificateEntity(
      id: model.id,
      name: model.name,
      organization: model.organization,
      issueDate: model.issueDate,
      expirationDate: model.expirationDate,
      fileUrl: model.file.url,
    );
  }
}