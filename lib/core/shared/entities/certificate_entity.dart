class CertificateEntity {
  final String id;
  final String name;
  final String organization;
  final String issueDate;
  final String? expirationDate;
  final String? fileUrl;

  const CertificateEntity({
    required this.id,
    required this.name,
    required this.organization,
    required this.issueDate,
    this.expirationDate,
    required this.fileUrl,
  });
}
