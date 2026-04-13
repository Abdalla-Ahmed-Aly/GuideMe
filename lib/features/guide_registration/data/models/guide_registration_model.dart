import 'package:hive_ce/hive.dart';
import 'package:collection/collection.dart';
import 'availability_model.dart';
import '../../../../core/shared/models/picked_file_model.dart';

class GuideRegistrationModel extends HiveObject {
  final int yearsOfExperience;
  final List<String> languages;
  final List<String> expertise;
  final double hourlyRate;
  final String currency;
  final List<String> guideCities;
  final AvailabilityModel availability;
  final PickedFileModel? profilePhoto;
  final List<PickedFileModel?> nationalId;
  final PickedFileModel? guideLicense;

  GuideRegistrationModel({
    this.yearsOfExperience = 0,
    this.languages = const [],
    this.expertise = const [],
    this.hourlyRate = 0.0,
    this.currency = 'USD',
    this.guideCities = const [],
    required this.availability,
    this.profilePhoto,
    this.nationalId = const [],
    this.guideLicense,
  });

  factory GuideRegistrationModel.initial() => GuideRegistrationModel(
        availability: AvailabilityModel(days: [], from: '09:00', to: '17:00'),
      );

  factory GuideRegistrationModel.fromJson(Map<String, dynamic> json) =>
      GuideRegistrationModel(
        yearsOfExperience: json['yearsOfExperience'] ?? 0,
        languages: List<String>.from(json['languages'] ?? []),
        expertise: List<String>.from(json['expertise'] ?? []),
        hourlyRate: (json['hourlyRate'] ?? 0).toDouble(),
        currency: json['currency'] ?? 'USD',
        guideCities: List<String>.from(json['guideCities'] ?? []),
        availability: AvailabilityModel.fromJson(json['availability'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        'yearsOfExperience': yearsOfExperience,
        'languages': languages,
        'expertise': expertise,
        'hourlyRate': hourlyRate,
        'currency': currency,
        'guideCities': guideCities,
        'availability': availability.toJson(),
      };

  GuideRegistrationModel copyWith({
    int? yearsOfExperience,
    List<String>? languages,
    List<String>? expertise,
    double? hourlyRate,
    String? currency,
    List<String>? guideCities,
    AvailabilityModel? availability,
    PickedFileModel? profilePhoto,
    List<PickedFileModel?>? nationalId,
    PickedFileModel? guideLicense,
  }) =>
      GuideRegistrationModel(
        yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
        languages: languages ?? this.languages,
        expertise: expertise ?? this.expertise,
        hourlyRate: hourlyRate ?? this.hourlyRate,
        currency: currency ?? this.currency,
        guideCities: guideCities ?? this.guideCities,
        availability: availability ?? this.availability,
        profilePhoto: profilePhoto ?? this.profilePhoto,
        nationalId: nationalId ?? this.nationalId,
        guideLicense: guideLicense ?? this.guideLicense,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuideRegistrationModel &&
          runtimeType == other.runtimeType &&
          yearsOfExperience == other.yearsOfExperience &&
          const ListEquality().equals(languages, other.languages) &&
          const ListEquality().equals(expertise, other.expertise) &&
          hourlyRate == other.hourlyRate &&
          currency == other.currency &&
          const ListEquality().equals(guideCities, other.guideCities) &&
          availability == other.availability &&
          profilePhoto == other.profilePhoto &&
          const ListEquality().equals(nationalId, other.nationalId) &&
          guideLicense == other.guideLicense;

  @override
  int get hashCode => Object.hashAll([
        yearsOfExperience,
        const ListEquality().hash(languages),
        const ListEquality().hash(expertise),
        hourlyRate,
        currency,
        const ListEquality().hash(guideCities),
        availability,
        profilePhoto,
        const ListEquality().hash(nationalId),
        guideLicense,
      ]);
}

class GuideRegistrationModelAdapter extends TypeAdapter<GuideRegistrationModel> {
  @override
  final int typeId = 12;

  @override
  GuideRegistrationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GuideRegistrationModel(
      yearsOfExperience: fields[0] as int,
      languages: (fields[1] as List).cast<String>(),
      expertise: (fields[2] as List).cast<String>(),
      hourlyRate: fields[3] as double,
      currency: fields[4] as String,
      guideCities: (fields[5] as List).cast<String>(),
      availability: fields[6] as AvailabilityModel,
      profilePhoto: fields[7] as PickedFileModel?,
      nationalId: (fields[8] as List?)?.cast<PickedFileModel?>() ?? [],
      guideLicense: fields[9] as PickedFileModel?,
    );
  }

  @override
  void write(BinaryWriter writer, GuideRegistrationModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.yearsOfExperience)
      ..writeByte(1)
      ..write(obj.languages)
      ..writeByte(2)
      ..write(obj.expertise)
      ..writeByte(3)
      ..write(obj.hourlyRate)
      ..writeByte(4)
      ..write(obj.currency)
      ..writeByte(5)
      ..write(obj.guideCities)
      ..writeByte(6)
      ..write(obj.availability)
      ..writeByte(7)
      ..write(obj.profilePhoto)
      ..writeByte(8)
      ..write(obj.nationalId)
      ..writeByte(9)
      ..write(obj.guideLicense);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuideRegistrationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
