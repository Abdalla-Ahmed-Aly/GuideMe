import 'dart:typed_data';

class PickedFileModel {
  final String name;
  final String? path;
  final int size;
  final Uint8List? bytes;

  const PickedFileModel({
    required this.name,
    required this.size,
    this.path,
    this.bytes,
  });

  bool get hasPath => path != null && path!.isNotEmpty;
}