class AboutUsModel {
  final int id;
  final String title;
  final String content;
  final DateTime createdOn;
  final DateTime updatedOn;

  AboutUsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdOn,
    required this.updatedOn,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      createdOn: DateTime.tryParse(json['created_on'] ?? '') ?? DateTime.now(),
      updatedOn: DateTime.tryParse(json['updated_on'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'created_on': createdOn.toIso8601String(),
      'updated_on': updatedOn.toIso8601String(),
    };
  }
}
