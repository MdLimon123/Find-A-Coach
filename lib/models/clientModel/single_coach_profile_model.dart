class SingleCoachProfileModel {

  final CoachProfile user;

  SingleCoachProfileModel({

    required this.user,
  });

  factory SingleCoachProfileModel.fromJson(Map<String, dynamic> json) {
    return SingleCoachProfileModel(
      user: CoachProfile.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {

      'user': user.toJson(),
    };
  }
}

class CoachProfile {
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
  final Availability availability;
  final double pricePerSession;
  final bool neurodiversityAffirming;
  final bool lgbtqiaAffirming;
  final bool genderSensitive;
  final bool traumaSensitive;
  final bool faithBased;
  final DateTime dateJoined;
  final DateTime lastLogin;
  final List<String> subCoachingAreas;

  CoachProfile({
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
    required this.subCoachingAreas,
  });

  factory CoachProfile.fromJson(Map<String, dynamic> json) {
    return CoachProfile(
      userId: json['user_id'],
      coachingAreas: List<int>.from(json['coaching_areas']),
      coachingAreaNames: (json['coaching_area_names'] as List? ?? [])
          .map((e) => e.toString())
          .toList(),
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
      totalRatingCount: json['total_rating_count'] ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      viewAsUser: json['view_as_user'] ?? false,
      certifications: (json['certifications'] as List? ?? [])
          .map((e) => e.toString())
          .toList(),
      languagesSpoken: (json['languages_spoken'] as List? ?? [])
          .map((e) => e.toString())
          .toList(),
      personalWebsite: json['personal_website'] ?? '',
      linkedinProfile: json['linkedin_profile'] ?? '',
      sessionFormat: json['session_format'] ?? '',
      availability: Availability.fromJson(json['availability'] ?? {}),
      pricePerSession: (json['price_per_session'] as num?)?.toDouble() ?? 0.0,
      neurodiversityAffirming: json['neurodiversity_affirming'] ?? false,
      lgbtqiaAffirming: json['lgbtqia_affirming'] ?? false,
      genderSensitive: json['gender_sensitive'] ?? false,
      traumaSensitive: json['trauma_sensitive'] ?? false,
      faithBased: json['faith_based'] ?? false,
      dateJoined: DateTime.parse(json['date_joined']),
      lastLogin: DateTime.parse(json['last_login']),
      subCoachingAreas: (json['sub_coaching_areas'] as List? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }


  Map<String, dynamic> toJson() {
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
      'availability': availability.toJson(),
      'price_per_session': pricePerSession,
      'neurodiversity_affirming': neurodiversityAffirming,
      'lgbtqia_affirming': lgbtqiaAffirming,
      'gender_sensitive': genderSensitive,
      'trauma_sensitive': traumaSensitive,
      'faith_based': faithBased,
      'date_joined': dateJoined.toIso8601String(),
      'last_login': lastLogin.toIso8601String(),
      'sub_coaching_areas': subCoachingAreas,
    };
  }
}

class Availability {
  final List<TimeSlot> monday;
  final List<TimeSlot> tuesday;
  final List<TimeSlot>? wednesday;
  final List<TimeSlot>? thursday;
  final List<TimeSlot>? friday;
  final List<TimeSlot>? saturday;
  final List<TimeSlot>? sunday;

  Availability({
    required this.monday,
    required this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    List<TimeSlot> parseDay(dynamic day) {
      if (day == null) return [];
      return (day as List).map((e) => TimeSlot.fromJson(e)).toList();
    }

    return Availability(
      monday: parseDay(json['monday']),
      tuesday: parseDay(json['tuesday']),
      wednesday: parseDay(json['wednesday']),
      thursday: parseDay(json['thursday']),
      friday: parseDay(json['friday']),
      saturday: parseDay(json['saturday']),
      sunday: parseDay(json['sunday']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'monday': monday.map((e) => e.toJson()).toList(),
      'tuesday': tuesday.map((e) => e.toJson()).toList(),
      'wednesday': wednesday?.map((e) => e.toJson()).toList(),
      'thursday': thursday?.map((e) => e.toJson()).toList(),
      'friday': friday?.map((e) => e.toJson()).toList(),
      'saturday': saturday?.map((e) => e.toJson()).toList(),
      'sunday': sunday?.map((e) => e.toJson()).toList(),
    };
  }
}

class TimeSlot {
  final String from;
  final String to;

  TimeSlot({
    required this.from,
    required this.to,
  });

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(
      from: json['from'],
      to: json['to'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'from': from,
      'to': to,
    };
  }
}
