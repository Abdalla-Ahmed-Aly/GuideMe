import 'package:guide_me/core/shared/models/certificate_model.dart';
import 'package:guide_me/core/shared/entities/certificate_entity.dart';

class CertificateMapper {
  static CertificateEntity toEntity(CertificateModel model) {
    return CertificateEntity(
      id: model.id ?? "Unkown",
      name: model.name ?? "Unkown",
      organization: model.organization ?? "Unkown",
      issueDate: model.issueDate ?? "Unkown",
      expirationDate: model.expirationDate, 
      fileUrl: model.file?.url ,
    );
  }
}