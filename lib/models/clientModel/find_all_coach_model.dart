

class FindAllCoachModel {

  final int totalCoaches;
  final List<FindAllCoach> data;

  FindAllCoachModel({
    required this.totalCoaches,
    required this.data,
  });

  factory FindAllCoachModel.fromJson(Map<String, dynamic> json) {
    return FindAllCoachModel(
      totalCoaches: json['total_coaches'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => FindAllCoach.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'total_coaches': totalCoaches,
    'data': data.map((e) => e.toJson()).toList(),
  };
}

class FindAllCoach {
  final int userId;
  final List<int> coachingAreas;
  final List<String> coachingAreaNames;
  final String application;
  final String role;
  final String? fullName;
  final String email;
  final String? image;
  final String? googleImageUrl;
  final String? facebookId;
  final String? facebookImageUrl;
  final int? age;
  final String? location;
  final String? bio;
  final String? gender;
  final int totalRatingCount;
  final double rating;
  final bool viewAsUser;
  final List<String>? certifications;
  final List<String>? languagesSpoken;
  final String? personalWebsite;
  final String? linkedinProfile;
  final String sessionFormat;
  final Availability? availability;
  final double? pricePerSession;
  final bool neurodiversityAffirming;
  final bool lgbtqiaAffirming;
  final bool genderSensitive;
  final bool traumaSensitive;
  final bool faithBased;
  final DateTime dateJoined;
  final DateTime lastLogin;

  FindAllCoach({
    required this.userId,
    required this.coachingAreas,
    required this.coachingAreaNames,
    required this.application,
    required this.role,
    required this.fullName,
    required this.email,
    required this.image,
    required this.googleImageUrl,
    required this.facebookId,
    required this.facebookImageUrl,
    required this.age,
    required this.location,
    required this.bio,
    required this.gender,
    required this.totalRatingCount,
    required this.rating,
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

  factory FindAllCoach.fromJson(Map<String, dynamic> json) {
    return FindAllCoach(
      userId: json['user_id'] as int,
      coachingAreas: (json['coaching_areas'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      coachingAreaNames: (json['coaching_area_names'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      application: json['application'] as String,
      role: json['role'] as String,
      fullName: _nullIfEmpty(json['full_name']),
      email: json['email'] as String,
      image: json['image'] as String?,
      googleImageUrl: json['google_image_url'] as String?,
      facebookId: json['facebook_id'] as String?,
      facebookImageUrl: json['facebook_image_url'] as String?,
      age: json['age'] as int?,
      location: json['location'] as String?,
      bio: json['bio'] as String?,
      gender: json['gender'] as String?,
      totalRatingCount: json['total_rating_count'] as int,
      rating: (json['rating'] as num).toDouble(),
      viewAsUser: json['view_as_user'] as bool,
      certifications: (json['certifications'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      languagesSpoken: (json['languages_spoken'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      personalWebsite: json['personal_website'] as String?,
      linkedinProfile: json['linkedin_profile'] as String?,
      sessionFormat: json['session_format'] as String,
      availability: json['availability'] == null
          ? null
          : Availability.fromJson(
          json['availability'] as Map<String, dynamic>),
      pricePerSession: (json['price_per_session'] as num?)?.toDouble(),
      neurodiversityAffirming: json['neurodiversity_affirming'] as bool,
      lgbtqiaAffirming: json['lgbtqia_affirming'] as bool,
      genderSensitive: json['gender_sensitive'] as bool,
      traumaSensitive: json['trauma_sensitive'] as bool,
      faithBased: json['faith_based'] as bool,
      dateJoined: DateTime.parse(json['date_joined'] as String),
      lastLogin: DateTime.parse(json['last_login'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'coaching_areas': coachingAreas,
    'coaching_area_names': coachingAreaNames,
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
    'total_rating_count': totalRatingCount,
    'rating': rating,
    'view_as_user': viewAsUser,
    'certifications': certifications,
    'languages_spoken': languagesSpoken,
    'personal_website': personalWebsite,
    'linkedin_profile': linkedinProfile,
    'session_format': sessionFormat,
    'availability': availability?.toJson(),
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

class Availability {
  final Map<String, List<AvailabilitySlot>> slotsByDay;

  Availability({required this.slotsByDay});

  factory Availability.fromJson(Map<String, dynamic> json) {
    final map = <String, List<AvailabilitySlot>>{};
    json.forEach((key, value) {
      final list = (value as List<dynamic>)
          .map((e) => AvailabilitySlot.fromJson(e as Map<String, dynamic>))
          .toList();
      map[key] = list;
    });
    return Availability(slotsByDay: map);
  }

  Map<String, dynamic> toJson() => slotsByDay.map((key, value) =>
      MapEntry(key, value.map((e) => e.toJson()).toList()));
}

class AvailabilitySlot {
  final String from; 
  final String to;

  AvailabilitySlot({required this.from, required this.to});

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) =>
      AvailabilitySlot(
        from: json['from'] as String,
        to: json['to'] as String,
      );

  Map<String, dynamic> toJson() => {
    'from': from,
    'to': to,
  };
}

/// Helper to treat "" as null for some string fields
String? _nullIfEmpty(dynamic v) {
  if (v == null) return null;
  final s = v as String;
  return s.trim().isEmpty ? null : s;
}
