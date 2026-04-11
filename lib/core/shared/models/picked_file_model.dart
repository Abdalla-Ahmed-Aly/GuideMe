import 'dart:typed_data';
import 'package:hive_ce/hive.dart';

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

class PickedFileModelAdapter extends TypeAdapter<PickedFileModel> {
  @override
  final int typeId = 13;

  @override
  PickedFileModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PickedFileModel(
      name: fields[0] as String,
      path: fields[1] as String?,
      size: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PickedFileModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.size);
  }
}