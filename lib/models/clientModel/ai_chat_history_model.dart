import 'dart:convert';

/// Parent model
class AllHistoryModel {
  final List<SessionModel> sessions;

  AllHistoryModel({required this.sessions});

  factory AllHistoryModel.fromJson(Map<String, dynamic> json) {
    return AllHistoryModel(
      sessions: (json['sessions'] as List<dynamic>)
          .map((e) => SessionModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'sessions': sessions.map((e) => e.toJson()).toList(),
  };

  static AllHistoryModel fromRawJson(String str) =>
      AllHistoryModel.fromJson(jsonDecode(str));

  /// ➡️ copyWith for AllHistoryModel
  AllHistoryModel copyWith({
    List<SessionModel>? sessions,
  }) {
    return AllHistoryModel(
      sessions: sessions ?? this.sessions,
    );
  }
}

/// Each session item
class SessionModel {
  final String sessionId;
  final int userId;
  final String? sessionTitle;
  final DateTime createdAt;

  SessionModel({
    required this.sessionId,
    required this.userId,
    this.sessionTitle,
    required this.createdAt,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      sessionId: json['session_id'] as String,
      userId: json['user_id'] as int,
      sessionTitle: json['session_title'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'session_id': sessionId,
    'user_id': userId,
    'session_title': sessionTitle,
    'created_at': createdAt.toIso8601String(),
  };

  /// ➡️ copyWith for SessionModel
  SessionModel copyWith({
    String? sessionId,
    int? userId,
    String? sessionTitle,
    DateTime? createdAt,
  }) {
    return SessionModel(
      sessionId: sessionId ?? this.sessionId,
      userId: userId ?? this.userId,
      sessionTitle: sessionTitle ?? this.sessionTitle,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
