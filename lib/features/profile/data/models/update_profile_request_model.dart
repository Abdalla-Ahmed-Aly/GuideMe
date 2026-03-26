import 'package:dio/dio.dart';
import 'package:guide_me/core/shared/models/picked_file_model.dart';

class UpdateProfileRequestModel {
  final String? name;
  final String? phone;
  final PickedFileModel? file;
  final String? lat;
  final String? long;

  UpdateProfileRequestModel({
    required this.name,
    required this.phone,
    required this.file,
    required this.lat,
    required this.long,
  });

  Future<FormData> toFormData() async {
    return FormData.fromMap({
      if (name != null) "name": name,
      if (phone != null) "phone": phone,
      if (file != null) "photo": await MultipartFile.fromFile(file!.path!),
      if (lat != null) "lat": lat,
      if (long != null) "long": long,
    });
  }
}
