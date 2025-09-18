class ClientCommentModel {
  final String status;
  final List<ClientComment> data;

  ClientCommentModel({
    required this.status,
    required this.data,
  });

  factory ClientCommentModel.fromJson(Map<String, dynamic> json) {
    return ClientCommentModel(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => ClientComment.fromJson(e))
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

class ClientComment {
  final int id;
  final String userName;
  final String image;
  final String content;
  final DateTime createdAt;

  ClientComment({
    required this.id,
    required this.userName,
    required this.image,
    required this.content,
    required this.createdAt,
  });

  factory ClientComment.fromJson(Map<String, dynamic> json) {
    return ClientComment(
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
