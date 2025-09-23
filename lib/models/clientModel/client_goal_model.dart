class ClientGoalModel {
  final int id;
  final int userId;
  final String title;
  final DateTime createdAt;
  final int totalMilestones;
  final int completedMilestones;
  final List<Milestone> milestones;

  ClientGoalModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.createdAt,
    required this.totalMilestones,
    required this.completedMilestones,
    required this.milestones,
  });

  factory ClientGoalModel.fromJson(Map<String, dynamic> json) {
    return ClientGoalModel(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
      totalMilestones: json['total_milestones'] ?? 0,
      completedMilestones: json['completed_milestones'] ?? 0,
      milestones: (json['milestones'] as List<dynamic>)
          .map((e) => Milestone.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'title': title,
    'created_at': createdAt.toIso8601String(),
    'total_milestones': totalMilestones,
    'completed_milestones': completedMilestones,
    'milestones': milestones.map((e) => e.toJson()).toList(),
  };
}

class Milestone {
  final int id;
  final int goalId;
  final String description;
  bool isCompleted;
  final int order;
  final DateTime createdAt;

  Milestone({
    required this.id,
    required this.goalId,
    required this.description,
    required this.isCompleted,
    required this.order,
    required this.createdAt,
  });

  factory Milestone.fromJson(Map<String, dynamic> json) {
    return Milestone(
      id: json['id'],
      goalId: json['goal_id'],
      description: json['description'] ?? '',
      isCompleted: json['is_completed'] ?? false,
      order: json['order'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'goal_id': goalId,
    'description': description,
    'is_completed': isCompleted,
    'order': order,
    'created_at': createdAt.toIso8601String(),
  };


  Milestone copyWith({
    int? id,
    int? goalId,
    String? description,
    bool? isCompleted,
    int? order,
    DateTime? createdAt,
  }) {
    return Milestone(
      id: id ?? this.id,
      goalId: goalId ?? this.goalId,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
