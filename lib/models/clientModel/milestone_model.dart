class MilestoneModel {
  final int id;
  final int goalId;
  final String description;
  final bool isCompleted;
  final int order;
  final DateTime createdAt;

  MilestoneModel({
    required this.id,
    required this.goalId,
    required this.description,
    required this.isCompleted,
    required this.order,
    required this.createdAt,
  });

  /// JSON থেকে Model তৈরি করা
  factory MilestoneModel.fromJson(Map<String, dynamic> json) {
    return MilestoneModel(
      id: json['id'] as int,
      goalId: json['goal_id'] as int,
      description: json['description'] ?? '',
      isCompleted: json['is_completed'] ?? false,
      order: json['order'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  /// Model থেকে JSON তৈরি করা
  Map<String, dynamic> toJson() => {
    'id': id,
    'goal_id': goalId,
    'description': description,
    'is_completed': isCompleted,
    'order': order,
    'created_at': createdAt.toIso8601String(),
  };

  /// copyWith method
  MilestoneModel copyWith({
    bool? isCompleted,
    String? description,
    int? order,
  }) {
    return MilestoneModel(
      id: id,
      goalId: goalId,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      order: order ?? this.order,
      createdAt: createdAt,
    );
  }
}
