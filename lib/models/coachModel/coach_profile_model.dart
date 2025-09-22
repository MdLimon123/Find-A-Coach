class CoachProfileModel {
  int userId;
  CoachRating coachRating;
  List<int> coachingAreas;
  List<String> coachingAreaNames;
  List<int> subCoachingAreas;
  List<String> subCoachingAreaNames;
  String application;
  String role;
  String fullName;
  String email;
  String image;
  String? googleImageUrl;
  String? facebookId;
  String? facebookImageUrl;
  int age;
  String location;
  String bio;
  String gender;
  bool viewAsUser;
  List<String> certifications;
  List<String> languagesSpoken;
  String personalWebsite;
  String linkedinProfile;
  String sessionFormat;
  Map<String, List<CoachAvailability>> availability;
  double pricePerSession;
  bool neurodiversityAffirming;
  bool lgbtqiaAffirming;
  bool genderSensitive;
  bool traumaSensitive;
  bool faithBased;
  DateTime dateJoined;
  DateTime lastLogin;

  CoachProfileModel({
    required this.userId,
    required this.coachRating,
    required this.coachingAreas,
    required this.coachingAreaNames,
    required this.subCoachingAreas,
    required this.subCoachingAreaNames,
    required this.application,
    required this.role,
    required this.fullName,
    required this.email,
    required this.image,
    this.googleImageUrl,
    this.facebookId,
    this.facebookImageUrl,
    required this.age,
    required this.location,
    required this.bio,
    required this.gender,
    required this.viewAsUser,
    required this.certifications,
    required this.languagesSpoken,
    required this.personalWebsite,
    required this.linkedinProfile,
    required this.sessionFormat,
    required this.availability,
    required this.pricePerSession,
    required this.neurodiversityAffirming,
    required this.lgbtqiaAffirming,
    required this.genderSensitive,
    required this.traumaSensitive,
    required this.faithBased,
    required this.dateJoined,
    required this.lastLogin,
  });

  factory CoachProfileModel.fromJson(Map<String, dynamic> json) {
    return CoachProfileModel(
      userId: json['user_id'] ?? 0,
      coachRating: CoachRating.fromJson(json['coach_rating'] ?? {}),
      coachingAreas: List<int>.from(json['coaching_areas'] ?? []),
      coachingAreaNames: List<String>.from(json['coaching_area_names'] ?? []),
      subCoachingAreas: List<int>.from(json['sub_coaching_areas'] ?? []),
      subCoachingAreaNames: List<String>.from(json['sub_coaching_area_names'] ?? []),
      application: json['application'] ?? "",
      role: json['role'] ?? "",
      fullName: json['full_name'] ?? "",
      email: json['email'] ?? "",
      image: json['image'] ?? "",
      googleImageUrl: json['google_image_url'],
      facebookId: json['facebook_id'],
      facebookImageUrl: json['facebook_image_url'],
      age: json['age'] ?? 0,
      location: json['location'] ?? "",
      bio: json['bio'] ?? "",
      gender: json['gender'] ?? "",
      viewAsUser: json['view_as_user'] ?? false,
      certifications: List<String>.from(json['certifications'] ?? []),
      languagesSpoken: List<String>.from(json['languages_spoken'] ?? []),
      personalWebsite: json['personal_website'] ?? "",
      linkedinProfile: json['linkedin_profile'] ?? "",
      sessionFormat: json['session_format'] ?? "",
        availability: ((json['availability'] ?? {}) as Map<String, dynamic>).map<String, List<CoachAvailability>>(
              (key, value) => MapEntry(
            key.toString(),
            List<CoachAvailability>.from(
                ((value ?? []) as List).map((e) => CoachAvailability.fromJson(e as Map<String, dynamic>))
            ),
          ),
        ),

      pricePerSession: (json['price_per_session'] ?? 0).toDouble(),
      neurodiversityAffirming: json['neurodiversity_affirming'] ?? false,
      lgbtqiaAffirming: json['lgbtqia_affirming'] ?? false,
      genderSensitive: json['gender_sensitive'] ?? false,
      traumaSensitive: json['trauma_sensitive'] ?? false,
      faithBased: json['faith_based'] ?? false,
      dateJoined: DateTime.tryParse(json['date_joined'] ?? "") ?? DateTime.now(),
      lastLogin: DateTime.tryParse(json['last_login'] ?? "") ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'coach_rating': coachRating.toJson(),
      'coaching_areas': coachingAreas,
      'coaching_area_names': coachingAreaNames,
      'sub_coaching_areas': subCoachingAreas,
      'sub_coaching_area_names': subCoachingAreaNames,
      'application': application,
      'role': role,
      'full_name': fullName,
      'email': email,
      'image': image,
      'google_image_url': googleImageUrl,
      'facebook_id': facebookId,
      'facebook_image_url': facebookImageUrl,
      'age': age,
      'location': location,
      'bio': bio,
      'gender': gender,
      'view_as_user': viewAsUser,
      'certifications': certifications,
      'languages_spoken': languagesSpoken,
      'personal_website': personalWebsite,
      'linkedin_profile': linkedinProfile,
      'session_format': sessionFormat,
      'availability': availability.map(
            (key, value) => MapEntry(key, value.map((e) => e.toJson()).toList()),
      ),
      'price_per_session': pricePerSession,
      'neurodiversity_affirming': neurodiversityAffirming,
      'lgbtqia_affirming': lgbtqiaAffirming,
      'gender_sensitive': genderSensitive,
      'trauma_sensitive': traumaSensitive,
      'faith_based': faithBased,
      'date_joined': dateJoined.toIso8601String(),
      'last_login': lastLogin.toIso8601String(),
    };
  }
}

class CoachRating {
  double avgRating;
  int totalReviews;

  CoachRating({required this.avgRating, required this.totalReviews});

  factory CoachRating.fromJson(Map<String, dynamic> json) {
    return CoachRating(
      avgRating: (json['avg_rating'] ?? 0).toDouble(),
      totalReviews: json['total_reviews'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'avg_rating': avgRating,
      'total_reviews': totalReviews,
    };
  }
}

class CoachAvailability {
  String from;
  String to;

  CoachAvailability({required this.from, required this.to});

  factory CoachAvailability.fromJson(Map<String, dynamic> json) {
    return CoachAvailability(
      from: json['from'] ?? "",
      to: json['to'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
    };
  }
}
