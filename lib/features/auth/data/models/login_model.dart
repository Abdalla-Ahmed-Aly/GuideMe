class LoginresponseModel {
  final bool success;
  final String message;
  final String? token;
  final LoginData? data;

  LoginresponseModel({
    required this.success,
    required this.message,
    this.token,
    this.data,
  });

  factory LoginresponseModel.fromJson(Map<String, dynamic> json) {
    return LoginresponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['token'],
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}

class LoginData {
  final UserModel? user;

  LoginData({this.user});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}

class UserModel {
  final Availability? availability;
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? role;
  final String? bio;
  final String? nationality;
  final List<dynamic>? interests;
  final String? location;
  final dynamic lat;
  final dynamic long;
  final bool? isVerified;
  final String? verificationStatus;
  final String? verificationNotes;
  final dynamic yearsOfExperience;
  final List<dynamic>? languages;
  final List<dynamic>? expertise;
  final dynamic hourlyRate;
  final String? currency;
  final List<dynamic>? guideCities;
  final int? totalEarnings;
  final int? completedTours;
  final bool? isLoggedIn;
  final bool? isOnline;
  final bool? isForgotPasswordOtpVerified;
  final List<dynamic>? certificates;
  final String? createdAt;
  final String? updatedAt;
  final String? forgotPasswordExpires;
  final String? forgotPasswordOTP;

  UserModel({
    this.availability,
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.bio,
    this.nationality,
    this.interests,
    this.location,
    this.lat,
    this.long,
    this.isVerified,
    this.verificationStatus,
    this.verificationNotes,
    this.yearsOfExperience,
    this.languages,
    this.expertise,
    this.hourlyRate,
    this.currency,
    this.guideCities,
    this.totalEarnings,
    this.completedTours,
    this.isLoggedIn,
    this.isOnline,
    this.isForgotPasswordOtpVerified,
    this.certificates,
    this.createdAt,
    this.updatedAt,
    this.forgotPasswordExpires,
    this.forgotPasswordOTP,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      availability: json['availability'] != null
          ? Availability.fromJson(json['availability'])
          : null,
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      bio: json['bio'],
      nationality: json['nationality'],
      interests: json['interests'] != null
          ? List<dynamic>.from(json['interests'])
          : [],
      location: json['location'],
      lat: json['lat'],
      long: json['long'],
      isVerified: json['isVerified'],
      verificationStatus: json['verificationStatus'],
      verificationNotes: json['verificationNotes'],
      yearsOfExperience: json['yearsOfExperience'],
      languages: json['languages'] != null
          ? List<dynamic>.from(json['languages'])
          : [],
      expertise: json['expertise'] != null
          ? List<dynamic>.from(json['expertise'])
          : [],
      hourlyRate: json['hourlyRate'],
      currency: json['currency'],
      guideCities: json['guideCities'] != null
          ? List<dynamic>.from(json['guideCities'])
          : [],
      totalEarnings: json['totalEarnings'],
      completedTours: json['completedTours'],
      isLoggedIn: json['isLoggedIn'],
      isOnline: json['isOnline'],
      isForgotPasswordOtpVerified: json['isForgotPasswordOtpVerified'],
      certificates: json['certificates'] != null
          ? List<dynamic>.from(json['certificates'])
          : [],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      forgotPasswordExpires: json['forgotPasswordExpires'],
      forgotPasswordOTP: json['forgotPasswordOTP'],
    );
  }
}

class Availability {
  final List<dynamic>? days;

  Availability({this.days});

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      days: json['days'] != null ? List<dynamic>.from(json['days']) : [],
    );
  }
}