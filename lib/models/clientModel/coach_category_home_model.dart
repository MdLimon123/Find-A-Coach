import 'dart:convert';


class CoachCategoryHomeModel {
  final String status;
  final List<CoachCategory> data;

  CoachCategoryHomeModel({
    required this.status,
    required this.data,
  });

  factory CoachCategoryHomeModel.fromJson(Map<String, dynamic> json) {
    return CoachCategoryHomeModel(
      status: json['status'] as String? ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => CoachCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data.map((e) => e.toJson()).toList(),
  };

  static CoachCategoryHomeModel fromRawJson(String str) =>
      CoachCategoryHomeModel.fromJson(json.decode(str));
  String toRawJson() => json.encode(toJson());
}


class CoachCategory {
  final String name;
  final List<Coach> coaches;

  CoachCategory({
    required this.name,
    required this.coaches,
  });

  factory CoachCategory.fromJson(Map<String, dynamic> json) {
    return CoachCategory(
      name: json['name'] as String? ?? '',
      coaches: (json['coaches'] as List<dynamic>? ?? [])
          .map((e) => Coach.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'coaches': coaches.map((e) => e.toJson()).toList(),
  };
}

/// Represents a single coach inside a category
class Coach {
  final int userId;
  final List<int> coachingAreas;
  final List<String> coachingAreaNames;
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
  final int totalRatingCount;
  final double rating;
  final bool viewAsUser;
  final List<String> certifications;
  final List<String> languagesSpoken;
  final String personalWebsite;
  final String linkedinProfile;
  final String sessionFormat;
  final Map<String, List<AvailabilitySlot>> availability;
  final double pricePerSession;
  final bool neurodiversityAffirming;
  final bool lgbtqiaAffirming;
  final bool genderSensitive;
  final bool traumaSensitive;
  final bool faithBased;
  final DateTime? dateJoined;
  final DateTime? lastLogin;

  Coach({
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

  factory Coach.fromJson(Map<String, dynamic> json) {
    Map<String, List<AvailabilitySlot>> parseAvailability(
        Map<String, dynamic>? avail) {
      final Map<String, List<AvailabilitySlot>> result = {};
      if (avail != null) {
        avail.forEach((day, list) {
          result[day] = (list as List<dynamic>)
              .map((e) => AvailabilitySlot.fromJson(e))
              .toList();
        });
      }
      return result;
    }

    return Coach(
      userId: json['user_id'] as int? ?? 0,
      coachingAreas: (json['coaching_areas'] as List<dynamic>? ?? [])
          .map((e) => int.tryParse(e.toString()) ?? 0)
          .toList(),
      coachingAreaNames:
      (json['coaching_area_names'] as List<dynamic>? ?? []).cast<String>(),
      application: json['application'] as String? ?? '',
      role: json['role'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      image: json['image'] as String? ?? '',
      googleImageUrl: json['google_image_url'] as String?,
      facebookId: json['facebook_id'] as String?,
      facebookImageUrl: json['facebook_image_url'] as String?,
      age: json['age'] as int? ?? 0,
      location: json['location'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      totalRatingCount: json['total_rating_count'] as int? ?? 0,
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : (json['rating'] as num?)?.toDouble() ?? 0.0,
      viewAsUser: json['view_as_user'] as bool? ?? false,
      certifications:
      (json['certifications'] as List<dynamic>? ?? []).cast<String>(),
      languagesSpoken:
      (json['languages_spoken'] as List<dynamic>? ?? []).cast<String>(),
      personalWebsite: json['personal_website'] as String? ?? '',
      linkedinProfile: json['linkedin_profile'] as String? ?? '',
      sessionFormat: json['session_format'] as String? ?? '',
      availability: parseAvailability(
          json['availability'] as Map<String, dynamic>?),
      pricePerSession:
      (json['price_per_session'] as num?)?.toDouble() ?? 0.0,
      neurodiversityAffirming:
      json['neurodiversity_affirming'] as bool? ?? false,
      lgbtqiaAffirming: json['lgbtqia_affirming'] as bool? ?? false,
      genderSensitive: json['gender_sensitive'] as bool? ?? false,
      traumaSensitive: json['trauma_sensitive'] as bool? ?? false,
      faithBased: json['faith_based'] as bool? ?? false,
      dateJoined: json['date_joined'] != null
          ? DateTime.tryParse(json['date_joined'])
          : null,
      lastLogin: json['last_login'] != null
          ? DateTime.tryParse(json['last_login'])
          : null,
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
    'availability': availability.map(
          (k, v) => MapEntry(k, v.map((e) => e.toJson()).toList()),
    ),
    'price_per_session': pricePerSession,
    'neurodiversity_affirming': neurodiversityAffirming,
    'lgbtqia_affirming': lgbtqiaAffirming,
    'gender_sensitive': genderSensitive,
    'trauma_sensitive': traumaSensitive,
    'faith_based': faithBased,
    'date_joined': dateJoined?.toIso8601String(),
    'last_login': lastLogin?.toIso8601String(),
  };
}


class AvailabilitySlot {
  final String from;
  final String to;

  AvailabilitySlot({required this.from, required this.to});

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) {
    return AvailabilitySlot(
      from: json['from'] as String? ?? '',
      to: json['to'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'from': from,
    'to': to,
  };
}
