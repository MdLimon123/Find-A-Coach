// upcoming_session_home_model.dart
import 'dart:convert';

/// Root model for the response
class UpcomingSessionHomeModel {
  final String status;
  final List<UpcomingSession> data;

  UpcomingSessionHomeModel({
    required this.status,
    required this.data,
  });

  factory UpcomingSessionHomeModel.fromJson(Map<String, dynamic> json) {
    return UpcomingSessionHomeModel(
      status: json['status'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UpcomingSession.fromJson(e as Map<String, dynamic>))
          .toList() ??
          <UpcomingSession>[],
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'data': data.map((e) => e.toJson()).toList(),
  };

  @override
  String toString() => 'UpcomingSessionHomeModel(status: $status, data: $data)';
}

/// Model representing a single upcoming session
class UpcomingSession {
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
  final DateTime? sessionDate;
  final String sessionTime;
  final String sessionFormat;
  final double price;
  final String status;
  final String notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UpcomingSession({
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

  /// Parse date strings carefully and provide null on failure
  static DateTime? _tryParseDate(String? s) {
    if (s == null || s.isEmpty) return null;
    try {
      return DateTime.parse(s);
    } catch (_) {
      // try format YYYY-MM-DD
      try {
        final parts = s.split('-');
        if (parts.length >= 3) {
          final y = int.parse(parts[0]);
          final m = int.parse(parts[1]);
          final d = int.parse(parts[2]);
          return DateTime(y, m, d);
        }
      } catch (_) {}
    }
    return null;
  }

  factory UpcomingSession.fromJson(Map<String, dynamic> json) {
    double _toDouble(dynamic v) {
      if (v == null) return 0.0;
      if (v is double) return v;
      if (v is int) return v.toDouble();
      return double.tryParse(v.toString()) ?? 0.0;
    }

    int _toInt(dynamic v) {
      if (v == null) return 0;
      if (v is int) return v;
      return int.tryParse(v.toString()) ?? 0;
    }

    return UpcomingSession(
      bookingId: _toInt(json['booking_id']),
      user: _toInt(json['user']),
      userName: json['user_name'] as String? ?? '',
      coach: _toInt(json['coach']),
      coachName: json['coach_name'] as String? ?? '',
      coachImage: json['coach_image'] as String? ?? '',
      totalRatingCount: _toInt(json['total_rating_count']),
      rating: _toDouble(json['rating']),
      coachingArea: _toInt(json['coaching_area']),
      coachingAreaName: json['coaching_area_name'] as String? ?? '',
      sessionDate: _tryParseDate(json['session_date'] as String?),
      sessionTime: json['session_time'] as String? ?? '',
      sessionFormat: json['session_format'] as String? ?? '',
      price: _toDouble(json['price']),
      status: json['status'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      createdAt: _tryParseDate(json['created_at'] as String?),
      updatedAt: _tryParseDate(json['updated_at'] as String?),
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
    'session_date': sessionDate?.toIso8601String().split('T').first,
    'session_time': sessionTime,
    'session_format': sessionFormat,
    'price': price,
    'status': status,
    'notes': notes,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  /// Combine sessionDate and sessionTime into a single DateTime (local).
  /// If sessionDate or sessionTime can't be parsed, returns null.
  DateTime? get sessionDateTime {
    if (sessionDate == null || sessionTime.isEmpty) return null;
    try {
      final timeParts = sessionTime.split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts.length > 1 ? timeParts[1] : '0');
      final second = timeParts.length > 2 ? int.parse(timeParts[2]) : 0;
      return DateTime(sessionDate!.year, sessionDate!.month, sessionDate!.day,
          hour, minute, second);
    } catch (_) {
      return null;
    }
  }

  UpcomingSession copyWith({
    int? bookingId,
    int? user,
    String? userName,
    int? coach,
    String? coachName,
    String? coachImage,
    int? totalRatingCount,
    double? rating,
    int? coachingArea,
    String? coachingAreaName,
    DateTime? sessionDate,
    String? sessionTime,
    String? sessionFormat,
    double? price,
    String? status,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UpcomingSession(
      bookingId: bookingId ?? this.bookingId,
      user: user ?? this.user,
      userName: userName ?? this.userName,
      coach: coach ?? this.coach,
      coachName: coachName ?? this.coachName,
      coachImage: coachImage ?? this.coachImage,
      totalRatingCount: totalRatingCount ?? this.totalRatingCount,
      rating: rating ?? this.rating,
      coachingArea: coachingArea ?? this.coachingArea,
      coachingAreaName: coachingAreaName ?? this.coachingAreaName,
      sessionDate: sessionDate ?? this.sessionDate,
      sessionTime: sessionTime ?? this.sessionTime,
      sessionFormat: sessionFormat ?? this.sessionFormat,
      price: price ?? this.price,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'UpcomingSession(bookingId: $bookingId, userName: $userName, coachName: $coachName, sessionDate: $sessionDate, sessionTime: $sessionTime, price: $price, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpcomingSession && other.bookingId == bookingId;
  }

  @override
  int get hashCode => bookingId.hashCode;
}
