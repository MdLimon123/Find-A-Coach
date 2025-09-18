class ClientUpcomingModel {
  final String status;
  final List<ClientUpcomingList> data;

  ClientUpcomingModel({
    required this.status,
    required this.data,
  });

  factory ClientUpcomingModel.fromJson(Map<String, dynamic> json) {
    return ClientUpcomingModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => ClientUpcomingList.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}

class ClientUpcomingList {
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
  final DateTime sessionDate;
  final String sessionTime;
  final String sessionFormat;
  final double price;
  final String status;
  final String notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  ClientUpcomingList({
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

  factory ClientUpcomingList.fromJson(Map<String, dynamic> json) {
    return ClientUpcomingList(
      bookingId: json['booking_id'] ?? 0,
      user: json['user'] ?? 0,
      userName: json['user_name'] ?? '',
      coach: json['coach'] ?? 0,
      coachName: json['coach_name'] ?? '',
      coachImage: json['coach_image'] ?? '',
      totalRatingCount: json['total_rating_count'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      coachingArea: json['coaching_area'] ?? 0,
      coachingAreaName: json['coaching_area_name'] ?? '',
      sessionDate: DateTime.tryParse(json['session_date'] ?? '') ?? DateTime.now(),
      sessionTime: json['session_time'] ?? '',
      sessionFormat: json['session_format'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      status: json['status'] ?? '',
      notes: json['notes'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      'session_date': sessionDate.toIso8601String(),
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
