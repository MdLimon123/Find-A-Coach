class SearchModel {
  final String status;
  final List<CoachData> data;

  SearchModel({
    required this.status,
    required this.data,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    status: json['status'] ?? '',
    data: (json['data'] as List<dynamic>)
        .map((e) => CoachData.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class CoachData {
  final int userId;
  final CoachRating coachRating;
  final List<int> coachingAreas;
  final List<String> coachingAreaNames;
  final List<int> subCoachingAreas;
  final List<String> subCoachingAreaNames;
  final String application;
  final String role;
  final String fullName;
  final String email;
  final String image;
  final String? googleImageUrl;
  final String? facebookId;
  final String? facebookImageUrl;
  final int age;
  final String location;
  final String bio;
  final String gender;
  final bool viewAsUser;
  final List<String> certifications;
  final List<String> languagesSpoken;
  final String personalWebsite;
  final String linkedinProfile;
  final String sessionFormat;
  final Map<String, List<Availability>> availability;
  final double pricePerSession;
  final bool neurodiversityAffirming;
  final bool lgbtqiaAffirming;
  final bool genderSensitive;
  final bool traumaSensitive;
  final bool faithBased;
  final DateTime dateJoined;
  final DateTime lastLogin;

  CoachData({
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

  factory CoachData.fromJson(Map<String, dynamic> json) {
    final availabilityMap = <String, List<Availability>>{};
    if (json['availability'] != null) {
      (json['availability'] as Map<String, dynamic>).forEach((day, slots) {
        availabilityMap[day] = (slots as List<dynamic>)
            .map((e) => Availability.fromJson(e as Map<String, dynamic>))
            .toList();
      });
    }

    return CoachData(
      userId: json['user_id'],
      coachRating: CoachRating.fromJson(json['coach_rating']),
      coachingAreas: List<int>.from(json['coaching_areas'] ?? []),
      coachingAreaNames: List<String>.from(json['coaching_area_names'] ?? []),
      subCoachingAreas: List<int>.from(json['sub_coaching_areas'] ?? []),
      subCoachingAreaNames:
      List<String>.from(json['sub_coaching_area_names'] ?? []),
      application: json['application'] ?? '',
      role: json['role'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      googleImageUrl: json['google_image_url'],
      facebookId: json['facebook_id'],
      facebookImageUrl: json['facebook_image_url'],
      age: json['age'] ?? 0,
      location: json['location'] ?? '',
      bio: json['bio'] ?? '',
      gender: json['gender'] ?? '',
      viewAsUser: json['view_as_user'] ?? false,
      certifications: List<String>.from(json['certifications'] ?? []),
      languagesSpoken: List<String>.from(json['languages_spoken'] ?? []),
      personalWebsite: json['personal_website'] ?? '',
      linkedinProfile: json['linkedin_profile'] ?? '',
      sessionFormat: json['session_format'] ?? '',
      availability: availabilityMap,
      pricePerSession: (json['price_per_session'] as num?)?.toDouble() ?? 0.0,
      neurodiversityAffirming: json['neurodiversity_affirming'] ?? false,
      lgbtqiaAffirming: json['lgbtqia_affirming'] ?? false,
      genderSensitive: json['gender_sensitive'] ?? false,
      traumaSensitive: json['trauma_sensitive'] ?? false,
      faithBased: json['faith_based'] ?? false,
      dateJoined: DateTime.parse(json['date_joined']),
      lastLogin: DateTime.parse(json['last_login']),
    );
  }

  Map<String, dynamic> toJson() => {
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
          (k, v) => MapEntry(k, v.map((e) => e.toJson()).toList()),
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

class CoachRating {
  final double avgRating;
  final int totalReviews;

  CoachRating({
    required this.avgRating,
    required this.totalReviews,
  });

  factory CoachRating.fromJson(Map<String, dynamic> json) => CoachRating(
    avgRating: (json['avg_rating'] as num?)?.toDouble() ?? 0.0,
    totalReviews: json['total_reviews'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    'avg_rating': avgRating,
    'total_reviews': totalReviews,
  };
}

class Availability {
  final String from;
  final String to;

  Availability({
    required this.from,
    required this.to,
  });

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    from: json['from'] ?? '',
    to: json['to'] ?? '',
  );

  Map<String, dynamic> toJson() => {
    'from': from,
    'to': to,
  };
}
