import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/picked_file_model.dart';
import 'media_picker_service.dart';

class MediaPickerServiceImpl implements MediaPickerService {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<PickedFileModel?> pickImage({
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: source);
      if (image == null) return null;

      final file = File(image.path);

      return PickedFileModel(
        name: image.name,
        path: image.path,
        size: await file.length(),
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<PickedFileModel?> pickFile({
    List<String>? allowedExtensions,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: allowedExtensions != null
            ? FileType.custom
            : FileType.any,
        allowedExtensions: allowedExtensions,
      );

      if (result == null) return null;

      final file = result.files.single;

      return PickedFileModel(
        name: file.name,
        path: file.path,
        size: file.size,
        bytes: file.bytes,
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<PickedFileModel?>> pickFiles({
    List<String>? allowedExtensions,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: allowedExtensions != null
            ? FileType.custom
            : FileType.any,
        allowedExtensions: allowedExtensions,
      );

      if (result == null) return [];

      return result.files.map((file) {
        return PickedFileModel(
          name: file.name,
          path: file.path,
          size: file.size,
          bytes: file.bytes,
        );
      }).toList();
    } catch (_) {
      return [];
    }
  }
}