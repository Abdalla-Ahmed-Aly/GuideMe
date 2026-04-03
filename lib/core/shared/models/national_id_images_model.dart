class NationalIdImagesModel {
  final String? front;
  final String? back;

  NationalIdImagesModel({this.front, this.back});

  factory NationalIdImagesModel.fromJson(Map<String, dynamic> json) =>
      NationalIdImagesModel(
        front: json['front'],
        back: json['back'],
      );

  Map<String, dynamic> toJson() => {
    'front': front,
    'back': back,
  };
}
