class CoachUpcomingSessionModel {
  final int bookingId;
  final int user;
  final String userName;
  final String userImage;
  final int coach;
  final String coachName;
  final String location;
  final String coachImage;
  final int coachingArea;
  final String coachingAreaName;
  final String sessionDate;
  final String sessionTime;
  final String sessionFormat;
  final double price;
  final String status;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  CoachUpcomingSessionModel({
    required this.bookingId,
    required this.user,
    required this.userName,
    required this.userImage,
    required this.coach,
    required this.coachName,
    required this.location,
    required this.coachImage,
    required this.coachingArea,
    required this.coachingAreaName,
    required this.sessionDate,
    required this.sessionTime,
    required this.sessionFormat,
    required this.price,
    required this.status,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CoachUpcomingSessionModel.fromJson(Map<String, dynamic> json) {
    return CoachUpcomingSessionModel(
      bookingId: json['booking_id'] as int,
      user: json['user'] as int,
      userName: json['user_name'] as String,
      userImage: json['user_image'] as String,
      coach: json['coach'] as int,
      coachName: json['coach_name'] as String,
      location: json['location'] as String,
      coachImage: json['coach_image'] as String,
      coachingArea: json['coaching_area'] as int,
      coachingAreaName: json['coaching_area_name'] as String,
      sessionDate: json['session_date'] as String,
      sessionTime: json['session_time'] as String,
      sessionFormat: json['session_format'] as String,
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'user': user,
      'user_name': userName,
      'user_image': userImage,
      'coach': coach,
      'coach_name': coachName,
      'location': location,
      'coach_image': coachImage,
      'coaching_area': coachingArea,
      'coaching_area_name': coachingAreaName,
      'session_date': sessionDate,
      'session_time': sessionTime,
      'session_format': sessionFormat,
      'price': price,
      'status': status,
      'notes': notes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
