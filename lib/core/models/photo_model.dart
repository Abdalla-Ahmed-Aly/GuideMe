class PhotoModel {
  final String url;
  final String publicId;

  const PhotoModel({
    required this.url,
    required this.publicId,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
    url: json['secure_url'] as String,
    publicId: json['public_id'] as String,
  );

  Map<String, dynamic> toJson() => {
    'secure_url': url,
    'public_id': publicId,
  };
}
