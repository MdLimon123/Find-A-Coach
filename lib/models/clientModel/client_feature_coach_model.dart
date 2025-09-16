

import 'dart:convert';

class ClientFeatureCoachModel {
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
  final Map<String, List<AvailabilitySlot>>? availability;
  final double? pricePerSession;
  final bool neurodiversityAffirming;
  final bool lgbtqiaAffirming;
  final bool genderSensitive;
  final bool traumaSensitive;
  final bool faithBased;
  final DateTime? dateJoined;
  final DateTime? lastLogin;

  ClientFeatureCoachModel({
    required this.userId,
    required this.coachingAreas,
    required this.coachingAreaNames,
    required this.application,
    required this.role,
    required this.fullName,
    required this.email,
    required this.image,
    this.googleImageUrl,
    this.facebookId,
    this.facebookImageUrl,
    this.age,
    this.location,
    this.bio,
    this.gender,
    required this.totalRatingCount,
    required this.rating,
    required this.viewAsUser,
    this.certifications,
    this.languagesSpoken,
    this.personalWebsite,
    this.linkedinProfile,
    required this.sessionFormat,
    this.availability,
    this.pricePerSession,
    required this.neurodiversityAffirming,
    required this.lgbtqiaAffirming,
    required this.genderSensitive,
    required this.traumaSensitive,
    required this.faithBased,
    this.dateJoined,
    this.lastLogin,
  });

  factory ClientFeatureCoachModel.fromJson(Map<String, dynamic> json) {
    Map<String, List<AvailabilitySlot>>? parsedAvailability;
    if (json['availability'] != null) {
      parsedAvailability = {};
      final Map<String, dynamic> availMap = Map<String, dynamic>.from(json['availability']);
      availMap.forEach((day, slotsRaw) {
        if (slotsRaw is List) {
          parsedAvailability![day] = slotsRaw
              .map((s) => AvailabilitySlot.fromJson(Map<String, dynamic>.from(s)))
              .toList();
        }
      });
    }

    return ClientFeatureCoachModel(
      userId: json['user_id'] is int ? json['user_id'] : int.parse(json['user_id'].toString()),
      coachingAreas: (json['coaching_areas'] as List<dynamic>?)?.map((e) => e as int).toList() ?? [],
      coachingAreaNames: (json['coaching_area_names'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
      application: json['application'] ?? '',
      role: json['role'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'] ?? '',
      googleImageUrl: json['google_image_url'],
      facebookId: json['facebook_id'],
      facebookImageUrl: json['facebook_image_url'],
      age: json['age'] is int ? json['age'] : (json['age'] != null ? int.tryParse(json['age'].toString()) : null),
      location: json['location'],
      bio: json['bio'],
      gender: json['gender'],
      totalRatingCount: json['total_rating_count'] is int ? json['total_rating_count'] : (json['total_rating_count'] != null ? int.parse(json['total_rating_count'].toString()) : 0),
      rating: (json['rating'] is num) ? (json['rating'] as num).toDouble() : double.tryParse(json['rating']?.toString() ?? '0.0') ?? 0.0,
      viewAsUser: json['view_as_user'] ?? false,
      certifications: (json['certifications'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      languagesSpoken: (json['languages_spoken'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      personalWebsite: json['personal_website'],
      linkedinProfile: json['linkedin_profile'],
      sessionFormat: json['session_format'] ?? '',
      availability: parsedAvailability,
      pricePerSession: json['price_per_session'] is num ? (json['price_per_session'] as num).toDouble() : (json['price_per_session'] != null ? double.tryParse(json['price_per_session'].toString()) : null),
      neurodiversityAffirming: json['neurodiversity_affirming'] ?? false,
      lgbtqiaAffirming: json['lgbtqia_affirming'] ?? false,
      genderSensitive: json['gender_sensitive'] ?? false,
      traumaSensitive: json['trauma_sensitive'] ?? false,
      faithBased: json['faith_based'] ?? false,
      dateJoined: json['date_joined'] != null ? DateTime.tryParse(json['date_joined']) : null,
      lastLogin: json['last_login'] != null ? DateTime.tryParse(json['last_login']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityJson = availability?.map((day, slots) => MapEntry(day, slots.map((s) => s.toJson()).toList()));

    return {
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
      'availability': availabilityJson,
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

  ClientFeatureCoachModel copyWith({
    int? userId,
    List<int>? coachingAreas,
    List<String>? coachingAreaNames,
    String? application,
    String? role,
    String? fullName,
    String? email,
    String? image,
    String? googleImageUrl,
    String? facebookId,
    String? facebookImageUrl,
    int? age,
    String? location,
    String? bio,
    String? gender,
    int? totalRatingCount,
    double? rating,
    bool? viewAsUser,
    List<String>? certifications,
    List<String>? languagesSpoken,
    String? personalWebsite,
    String? linkedinProfile,
    String? sessionFormat,
    Map<String, List<AvailabilitySlot>>? availability,
    double? pricePerSession,
    bool? neurodiversityAffirming,
    bool? lgbtqiaAffirming,
    bool? genderSensitive,
    bool? traumaSensitive,
    bool? faithBased,
    DateTime? dateJoined,
    DateTime? lastLogin,
  }) {
    return ClientFeatureCoachModel(
      userId: userId ?? this.userId,
      coachingAreas: coachingAreas ?? this.coachingAreas,
      coachingAreaNames: coachingAreaNames ?? this.coachingAreaNames,
      application: application ?? this.application,
      role: role ?? this.role,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      image: image ?? this.image,
      googleImageUrl: googleImageUrl ?? this.googleImageUrl,
      facebookId: facebookId ?? this.facebookId,
      facebookImageUrl: facebookImageUrl ?? this.facebookImageUrl,
      age: age ?? this.age,
      location: location ?? this.location,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      totalRatingCount: totalRatingCount ?? this.totalRatingCount,
      rating: rating ?? this.rating,
      viewAsUser: viewAsUser ?? this.viewAsUser,
      certifications: certifications ?? this.certifications,
      languagesSpoken: languagesSpoken ?? this.languagesSpoken,
      personalWebsite: personalWebsite ?? this.personalWebsite,
      linkedinProfile: linkedinProfile ?? this.linkedinProfile,
      sessionFormat: sessionFormat ?? this.sessionFormat,
      availability: availability ?? this.availability,
      pricePerSession: pricePerSession ?? this.pricePerSession,
      neurodiversityAffirming: neurodiversityAffirming ?? this.neurodiversityAffirming,
      lgbtqiaAffirming: lgbtqiaAffirming ?? this.lgbtqiaAffirming,
      genderSensitive: genderSensitive ?? this.genderSensitive,
      traumaSensitive: traumaSensitive ?? this.traumaSensitive,
      faithBased: faithBased ?? this.faithBased,
      dateJoined: dateJoined ?? this.dateJoined,
      lastLogin: lastLogin ?? this.lastLogin,
    );
  }

  @override
  String toString() => 'CoachModel(userId: $userId, fullName: $fullName, email: $email)';
}

class AvailabilitySlot {
  final String from;
  final String to;

  AvailabilitySlot({required this.from, required this.to});

  factory AvailabilitySlot.fromJson(Map<String, dynamic> json) =>
      AvailabilitySlot(from: json['from'] ?? '', to: json['to'] ?? '');

  Map<String, dynamic> toJson() => {'from': from, 'to': to};

  @override
  String toString() => 'AvailabilitySlot(from: $from, to: $to)';
}


List<ClientFeatureCoachModel> coachesFromResponse(String responseBody) {
  final Map<String, dynamic> map = json.decode(responseBody);
  final List<dynamic> data = map['data'] as List<dynamic>;
  return data.map((e) => ClientFeatureCoachModel.fromJson(Map<String, dynamic>.from(e))).toList();
}


