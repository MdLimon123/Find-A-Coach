class TermsAndCondition {
  final int id;
  final String title;
  final String content;
  final DateTime createdOn;
  final DateTime updatedOn;

  TermsAndCondition({
    required this.id,
    required this.title,
    required this.content,
    required this.createdOn,
    required this.updatedOn,
  });

  factory TermsAndCondition.fromJson(Map<String, dynamic> json) {
    return TermsAndCondition(
      id: json['id'] as int,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdOn: DateTime.parse(json['created_on']),
      updatedOn: DateTime.parse(json['updated_on']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'content': content,
    'created_on': createdOn.toIso8601String(),
    'updated_on': updatedOn.toIso8601String(),
  };
}
