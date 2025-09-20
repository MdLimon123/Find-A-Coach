class ClientProfileModel {
  final String status;
  final ClientUser? user;

  ClientProfileModel({
    required this.status,
    this.user,
  });

  factory ClientProfileModel.fromJson(Map<String, dynamic> json) {
    return ClientProfileModel(
      status: json['status'] ?? '',
      user: json['user'] != null
          ? ClientUser.fromJson(json['user'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'user': user?.toJson(),
  };
}


class ClientUser {
  final int userId;
  final String application;
  final String role;
  final String fullName;
  final String email;
  final String? image;
  final String? googleImageUrl;
  final String? facebookId;
  final String? facebookImageUrl;
  final int? age;
  final String? location;
  final String? bio;
  final String? ethnicity;
  final String? gender;
  final String? sexualOrientation;
  final List<String> neurotypes;
  final String? profession;
  final String? socialMediaLink;
  final String? interestsAndProjects;
  final String? anythingElse;
  final PrivateFields privateFields;
  final bool isSubscribed;
  final String? subscriptionType;
  final String? subscriptionStart;
  final String? subscriptionEnd;
  final bool viewAsUser;
  final String dateJoined;
  final String lastLogin;

  ClientUser({
    required this.userId,
    required this.application,
    required this.role,
    required this.fullName,
    required this.email,
    this.image,
    this.googleImageUrl,
    this.facebookId,
    this.facebookImageUrl,
    this.age,
    this.location,
    this.bio,
    this.ethnicity,
    this.gender,
    this.sexualOrientation,
    required this.neurotypes,
    this.profession,
    this.socialMediaLink,
    this.interestsAndProjects,
    this.anythingElse,
    required this.privateFields,
    required this.isSubscribed,
    this.subscriptionType,
    this.subscriptionStart,
    this.subscriptionEnd,
    required this.viewAsUser,
    required this.dateJoined,
    required this.lastLogin,
  });

  factory ClientUser.fromJson(Map<String, dynamic> json) {
    return ClientUser(
      userId: json['user_id'],
      application: json['application'] ?? '',
      role: json['role'] ?? '',
      fullName: json['full_name'] ?? '',
      email: json['email'] ?? '',
      image: json['image'],
      googleImageUrl: json['google_image_url'],
      facebookId: json['facebook_id'],
      facebookImageUrl: json['facebook_image_url'],
      age: json['age'],
      location: json['location'],
      bio: json['bio'],
      ethnicity: json['ethnicity'],
      gender: json['gender'],
      sexualOrientation: json['sexual_orientation'],
      neurotypes: List<String>.from(json['neurotypes'] ?? []),
      profession: json['profession'],
      socialMediaLink: json['social_media_link'],
      interestsAndProjects: json['interests_and_projects'],
      anythingElse: json['anything_else'],
      privateFields: PrivateFields.fromJson(json['private_fields']),
      isSubscribed: json['is_subscribed'] ?? false,
      subscriptionType: json['subscription_type'],
      subscriptionStart: json['subscription_start'],
      subscriptionEnd: json['subscription_end'],
      viewAsUser: json['view_as_user'] ?? false,
      dateJoined: json['date_joined'] ?? '',
      lastLogin: json['last_login'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'user_id': userId,
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
    'ethnicity': ethnicity,
    'gender': gender,
    'sexual_orientation': sexualOrientation,
    'neurotypes': neurotypes,
    'profession': profession,
    'social_media_link': socialMediaLink,
    'interests_and_projects': interestsAndProjects,
    'anything_else': anythingElse,
    'private_fields': privateFields.toJson(),
    'is_subscribed': isSubscribed,
    'subscription_type': subscriptionType,
    'subscription_start': subscriptionStart,
    'subscription_end': subscriptionEnd,
    'view_as_user': viewAsUser,
    'date_joined': dateJoined,
    'last_login': lastLogin,
  };
}

class PrivateFields {
  final bool age;
  final bool location;
  final bool bio;
  final bool ethnicity;
  final bool gender;
  final bool sexualOrientation;
  final bool neurotypes;
  final bool profession;
  final bool socialMediaLink;
  final bool interestsAndProjects;
  final bool anythingElse;

  PrivateFields({
    required this.age,
    required this.location,
    required this.bio,
    required this.ethnicity,
    required this.gender,
    required this.sexualOrientation,
    required this.neurotypes,
    required this.profession,
    required this.socialMediaLink,
    required this.interestsAndProjects,
    required this.anythingElse,
  });

  factory PrivateFields.fromJson(Map<String, dynamic> json) {
    return PrivateFields(
      age: json['age'] ?? false,
      location: json['location'] ?? false,
      bio: json['bio'] ?? false,
      ethnicity: json['ethnicity'] ?? false,
      gender: json['gender'] ?? false,
      sexualOrientation: json['sexual_orientation'] ?? false,
      neurotypes: json['neurotypes'] ?? false,
      profession: json['profession'] ?? false,
      socialMediaLink: json['social_media_link'] ?? false,
      interestsAndProjects: json['interests_and_projects'] ?? false,
      anythingElse: json['anything_else'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'age': age,
    'location': location,
    'bio': bio,
    'ethnicity': ethnicity,
    'gender': gender,
    'sexual_orientation': sexualOrientation,
    'neurotypes': neurotypes,
    'profession': profession,
    'social_media_link': socialMediaLink,
    'interests_and_projects': interestsAndProjects,
    'anything_else': anythingElse,
  };
}
