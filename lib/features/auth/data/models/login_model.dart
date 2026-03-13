class LoginresponseModel {
  final bool success;
  final String message;
  final String token;
  final LoginData data;

  LoginresponseModel({
    required this.success,
    required this.message,
    required this.token,
    required this.data,
  });

  factory LoginresponseModel.fromJson(Map<String, dynamic> json) {
    return LoginresponseModel(
      success: json['success'],
      message: json['message'],
      token: json['token'],
      data: LoginData.fromJson(json['data']),
    );
  }
}

class LoginData {
  final UserModel user;

  LoginData({required this.user});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      user: UserModel.fromJson(json['user']),
    );
  }
}

class UserModel {
  final Availability availability;
  final String id;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String? bio;
  final String? nationality;
  final List<dynamic> interests;
  final String? location;
  final dynamic lat;
  final dynamic long;
  final bool isVerified;
  final String verificationStatus;
  final String? verificationNotes;
  final dynamic yearsOfExperience;
  final List<dynamic> languages;
  final List<dynamic> expertise;
  final dynamic hourlyRate;
  final String currency;
  final List<dynamic> guideCities;
  final int totalEarnings;
  final int completedTours;
  final bool isLoggedIn;
  final bool isOnline;
  final bool isForgotPasswordOtpVerified;
  final List<dynamic> certificates;
  final String createdAt;
  final String updatedAt;
  final String forgotPasswordExpires;
  final String forgotPasswordOTP;

  UserModel({
    required this.availability,
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    this.bio,
    this.nationality,
    required this.interests,
    this.location,
    this.lat,
    this.long,
    required this.isVerified,
    required this.verificationStatus,
    this.verificationNotes,
    this.yearsOfExperience,
    required this.languages,
    required this.expertise,
    this.hourlyRate,
    required this.currency,
    required this.guideCities,
    required this.totalEarnings,
    required this.completedTours,
    required this.isLoggedIn,
    required this.isOnline,
    required this.isForgotPasswordOtpVerified,
    required this.certificates,
    required this.createdAt,
    required this.updatedAt,
    required this.forgotPasswordExpires,
    required this.forgotPasswordOTP,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      availability: Availability.fromJson(json['availability']),
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      bio: json['bio'],
      nationality: json['nationality'],
      interests: List<dynamic>.from(json['interests'] ?? []),
      location: json['location'],
      lat: json['lat'],
      long: json['long'],
      isVerified: json['isVerified'],
      verificationStatus: json['verificationStatus'],
      verificationNotes: json['verificationNotes'],
      yearsOfExperience: json['yearsOfExperience'],
      languages: List<dynamic>.from(json['languages'] ?? []),
      expertise: List<dynamic>.from(json['expertise'] ?? []),
      hourlyRate: json['hourlyRate'],
      currency: json['currency'],
      guideCities: List<dynamic>.from(json['guideCities'] ?? []),
      totalEarnings: json['totalEarnings'],
      completedTours: json['completedTours'],
      isLoggedIn: json['isLoggedIn'],
      isOnline: json['isOnline'],
      isForgotPasswordOtpVerified: json['isForgotPasswordOtpVerified'],
      certificates: List<dynamic>.from(json['certificates'] ?? []),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      forgotPasswordExpires: json['forgotPasswordExpires'],
      forgotPasswordOTP: json['forgotPasswordOTP'],
    );
  }
}

class Availability {
  final List<dynamic> days;

  Availability({required this.days});

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      days: List<dynamic>.from(json['days'] ?? []),
    );
  }
}