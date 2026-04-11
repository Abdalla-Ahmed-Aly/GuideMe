import 'package:hive_ce/hive.dart';
import 'package:collection/collection.dart';

class AvailabilityModel extends HiveObject {
  final List<String> days;
  final String from;
  final String to;

  AvailabilityModel({
    required this.days,
    required this.from,
    required this.to,
  });

  factory AvailabilityModel.fromJson(Map<String, dynamic> json) => AvailabilityModel(
        days: List<String>.from(json['days'] ?? []),
        from: json['from'] ?? '',
        to: json['to'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'days': days,
        'from': from,
        'to': to,
      };

  AvailabilityModel copyWith({
    List<String>? days,
    String? from,
    String? to,
  }) =>
      AvailabilityModel(
        days: days ?? this.days,
        from: from ?? this.from,
        to: to ?? this.to,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailabilityModel &&
          runtimeType == other.runtimeType &&
          const ListEquality().equals(days, other.days) &&
          from == other.from &&
          to == other.to;

  @override
  int get hashCode => Object.hashAll([
        const ListEquality().hash(days),
        from,
        to,
      ]);
}

class AvailabilityModelAdapter extends TypeAdapter<AvailabilityModel> {
  @override
  final int typeId = 11;

  @override
  AvailabilityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AvailabilityModel(
      days: (fields[0] as List).cast<String>(),
      from: fields[1] as String,
      to: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AvailabilityModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.days)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.to);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AvailabilityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
