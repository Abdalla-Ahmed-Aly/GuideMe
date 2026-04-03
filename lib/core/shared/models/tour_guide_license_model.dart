class TourGuideLicenseModel {
  final String? secureUrl;
  final String? publicId;

  TourGuideLicenseModel({this.secureUrl, this.publicId});

  factory TourGuideLicenseModel.fromJson(Map<String, dynamic> json) =>
      TourGuideLicenseModel(
        secureUrl: json['secure_url'],
        publicId: json['public_id'],
      );

  Map<String, dynamic> toJson() => {
    'secure_url': secureUrl,
    'public_id': publicId,
  };
}
