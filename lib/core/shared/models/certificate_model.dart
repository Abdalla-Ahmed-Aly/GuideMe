import 'package:guide_me/core/shared/models/photo_model.dart';

class CertificateModel {
  final String id;
  final String name;
  final String organization;
  final String issueDate;
  final String? expirationDate;
  final PhotoModel file;

  const CertificateModel({
    required this.id,
    required this.name,
    required this.organization,
    required this.issueDate,
    this.expirationDate,
    required this.file,
  });

  factory CertificateModel.fromJson(Map<String, dynamic> json) =>
      CertificateModel(
        id: json['_id'],
        name: json['name'],
        organization: json['organization'],
        issueDate: json['issueDate'],
        expirationDate: json['expirationDate'],
        file: PhotoModel.fromJson(json['file']),
      );
}
