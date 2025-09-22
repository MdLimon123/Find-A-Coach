class ClientBookingDetailsModel {
  final int bookingId;
  final int user;
  final String userName;
  final int coach;
  final String coachName;
  final String coachImage;
  final int totalRatingCount;
  final double rating;
  final int coachingArea;
  final String coachingAreaName;
  final String sessionDate;      // e.g. "2025-09-15"
  final String sessionTime;      // e.g. "10:00:00"
  final String sessionFormat;
  final double price;
  final String status;
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClientBookingDetailsModel({
    required this.bookingId,
    required this.user,
    required this.userName,
    required this.coach,
    required this.coachName,
    required this.coachImage,
    required this.totalRatingCount,
    required this.rating,
    required this.coachingArea,
    required this.coachingAreaName,
    required this.sessionDate,
    required this.sessionTime,
    required this.sessionFormat,
    required this.price,
    required this.status,
    required this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClientBookingDetailsModel.fromJson(Map<String, dynamic> json) {
    return ClientBookingDetailsModel(
      bookingId: json['booking_id'] ?? 0,
      user: json['user'],
      userName: json['user_name'] ?? '',
      coach: json['coach'],
      coachName: json['coach_name'] ?? '',
      coachImage: json['coach_image'] ?? '',
      totalRatingCount: json['total_rating_count'] ?? 0,
      rating: (json['rating'] != null) ? (json['rating'] as num).toDouble() : 0.0,
      coachingArea: json['coaching_area'],
      coachingAreaName: json['coaching_area_name'] ?? '',
      sessionDate: json['session_date'] ?? '',
      sessionTime: json['session_time'] ?? '',
      sessionFormat: json['session_format'] ?? '',
      price: (json['price'] != null) ? (json['price'] as num).toDouble() : 0.0,
      status: json['status'] ?? '',
      notes: json['notes'] ?? '',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
    );
  }


  Map<String, dynamic> toJson() => {
    'booking_id': bookingId,
    'user': user,
    'user_name': userName,
    'coach': coach,
    'coach_name': coachName,
    'coach_image': coachImage,
    'total_rating_count': totalRatingCount,
    'rating': rating,
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
