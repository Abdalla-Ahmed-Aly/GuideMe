import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../shared/models/picked_file_model.dart';
import 'media_picker_service.dart';

@LazySingleton(as: MediaPickerService)
class MediaPickerServiceImpl implements MediaPickerService {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<PickedFileModel?> persistFile(PickedFileModel pickedFile, {required String subDirectory}) async {
    if (pickedFile.path == null) return pickedFile;
    
    try {
      final appDocDir = await getApplicationDocumentsDirectory();
      final targetDir = Directory(p.join(appDocDir.path, subDirectory));
      
      if (!await targetDir.exists()) {
        await targetDir.create(recursive: true);
      }
      
      final originalFile = File(pickedFile.path!);
      final fileName = pickedFile.name;
      final newPath = p.join(targetDir.path, "${DateTime.now().millisecondsSinceEpoch}_$fileName");
      
      final movedFile = await originalFile.copy(newPath);
      
      return PickedFileModel(
        name: fileName,
        path: movedFile.path,
        size: pickedFile.size,
        bytes: pickedFile.bytes,
      );
    } catch (e) {
      if (e is PlatformException) {
        debugPrint('PlatformException: code=${e.code}, message=${e.message}');
      } else {
        debugPrint('Error: $e');
      }
      return pickedFile;
    }
  }

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
    } catch (e) {
      if (e is PlatformException) {
        debugPrint('PlatformException: code=${e.code}, message=${e.message}');
      } else {
        debugPrint('Error: $e');
      }
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
    } catch (e) {
      if (e is PlatformException) {
        debugPrint('PlatformException: code=${e.code}, message=${e.message}');
      } else {
        debugPrint('Error: $e');
      }
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
    } catch (e) {
      if (e is PlatformException) {
        debugPrint('PlatformException: code=${e.code}, message=${e.message}');
      } else {
        debugPrint('Error: $e');
      }
      return [];
    }
  }
}