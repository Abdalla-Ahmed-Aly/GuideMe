import 'package:guide_me/core/shared/models/certificate_model.dart';
import 'package:guide_me/core/shared/entities/certificate_entity.dart';
import 'package:guide_me/core/shared/models/photo_model.dart';

class CertificateMapper {
  static CertificateEntity toEntity(CertificateModel model) {
    return CertificateEntity(
      id: model.id ?? "Unkown",
      name: model.name ?? "Unkown",
      organization: model.organization ?? "Unkown",
      issueDate: model.issueDate ?? "Unkown",
      expirationDate: model.expirationDate,
      fileUrl: model.file?.url,
    );
  }

  static CertificateModel toModel(CertificateEntity entity) {
    return CertificateModel(
      id: entity.id,
      name: entity.name,
      organization: entity.organization,
      issueDate: entity.issueDate,
      expirationDate: entity.expirationDate,
      file: entity.fileUrl != null
          ? PhotoModel(url: entity.fileUrl, publicId: null)
          : null,
    );
  }
}
