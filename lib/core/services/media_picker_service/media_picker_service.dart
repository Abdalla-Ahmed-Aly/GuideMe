import 'package:image_picker/image_picker.dart';
import '../../shared/models/picked_file_model.dart';

abstract class MediaPickerService {
  Future<PickedFileModel?> pickImage({
    ImageSource source,
  });

  Future<PickedFileModel?> pickFile({
    List<String>? allowedExtensions,
  });

  Future<List<PickedFileModel?>> pickFiles({
    List<String>? allowedExtensions,
  });

  Future<PickedFileModel?> persistFile(PickedFileModel pickedFile, {required String subDirectory});
}