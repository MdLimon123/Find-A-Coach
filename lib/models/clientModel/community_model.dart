class CommunityModel {
  final int id;
  final String userName;
  final String image;
  final int topic;
  final String topicName;
  final String? title;
  final String content;
  final DateTime createdAt;
  final int commentsCount;
  final List<Comment> comments;

  CommunityModel({
    required this.id,
    required this.userName,
    required this.image,
    required this.topic,
    required this.topicName,
    this.title,
    required this.content,
    required this.createdAt,
    required this.commentsCount,
    required this.comments,
  });

  factory CommunityModel.fromJson(Map<String, dynamic> json) {
    return CommunityModel(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      image: json['image'] ?? '',
      topic: json['topic'] ?? 0,
      topicName: json['topic_name'] ?? '',
      title: json['title'], // nullable
      content: json['content'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      commentsCount: json['comments_count'] ?? 0,
      comments: (json['comments'] as List<dynamic>? ?? [])
          .map((e) => Comment.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'image': image,
      'topic': topic,
      'topic_name': topicName,
      'title': title,
      'content': content,
      'created_at': createdAt.toIso8601String(),
      'comments_count': commentsCount,
      'comments': comments.map((c) => c.toJson()).toList(),
    };
  }
}

class Comment {
  final int id;
  final String userName;
  final String image;
  final String content;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.userName,
    required this.image,
    required this.content,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'] ?? 0,
      userName: json['user_name'] ?? '',
      image: json['image'] ?? '',
      content: json['content'] ?? '',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_name': userName,
      'image': image,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
