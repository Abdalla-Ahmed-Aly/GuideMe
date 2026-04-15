import 'package:dio/dio.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';

class AddCertificationModel {
  final String name;
  final String organization;
  final String issueDate;
  final String? expirationDate;
  final PickedFileModel certificate;

  AddCertificationModel({
    required this.name,
    required this.organization,
    required this.issueDate,
    required this.expirationDate,
    required this.certificate,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      "name": name,
      "organization": organization,
      "issueDate": issueDate,
      if (expirationDate != null) "expirationDate": expirationDate,
      "certificate": await MultipartFile.fromFile(certificate.path!),
    });
  }
}
