class SaveCoachModel {
  final int id;
  final int coach;
  final String coachName;
  final String coachImage;
  final List<String> coachingAreaName;
  final String pricePerSession;
  final DateTime createdAt;

  SaveCoachModel({
    required this.id,
    required this.coach,
    required this.coachName,
    required this.coachImage,
    required this.coachingAreaName,
    required this.pricePerSession,
    required this.createdAt,
  });

  factory SaveCoachModel.fromJson(Map<String, dynamic> json) {
    return SaveCoachModel(
      id: json['id'] as int,
      coach: json['coach'] as int,
      coachName: json['coach_name'] ?? '',
      coachImage: json['coach_image'] ?? '',
      coachingAreaName: List<String>.from(json['coaching_area_name'] ?? []),
      pricePerSession: json['price_per_session']?.toString() ?? '',
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'coach': coach,
      'coach_name': coachName,
      'coach_image': coachImage,
      'coaching_area_name': coachingAreaName,
      'price_per_session': pricePerSession,
      'created_at': createdAt.toIso8601String(),
    };
  }

  /// Optional: copyWith for immutability
  SaveCoachModel copyWith({
    int? id,
    int? coach,
    String? coachName,
    String? coachImage,
    List<String>? coachingAreaName,
    String? pricePerSession,
    DateTime? createdAt,
  }) {
    return SaveCoachModel(
      id: id ?? this.id,
      coach: coach ?? this.coach,
      coachName: coachName ?? this.coachName,
      coachImage: coachImage ?? this.coachImage,
      coachingAreaName: coachingAreaName ?? this.coachingAreaName,
      pricePerSession: pricePerSession ?? this.pricePerSession,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
