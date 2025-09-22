class CoachUserBookingModel {
  int bookingId;
  int user;
  String userName;
  int coach;
  String coachName;
  String location;
  String coachImage;
  int coachingArea;
  String coachingAreaName;
  String sessionDate;
  String sessionTime;
  String sessionFormat;
  double price;
  String status;
  String? notes;
  DateTime createdAt;
  DateTime updatedAt;

  CoachUserBookingModel({
    required this.bookingId,
    required this.user,
    required this.userName,
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

  factory CoachUserBookingModel.fromJson(Map<String, dynamic> json) {
    return CoachUserBookingModel(
      bookingId: json['booking_id'] as int,
      user: json['user'] as int,
      userName: json['user_name'] as String,
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