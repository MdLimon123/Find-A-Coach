class SingleHistoryModel {
  final String? sessionId;
  final String? sessionTitle;
  final DateTime? createdAt;
  final List<ChatMessage> messages;

  SingleHistoryModel({
    this.sessionId,
    this.sessionTitle,
    this.createdAt,
    required this.messages,
  });

  factory SingleHistoryModel.fromJson(Map<String, dynamic> json) {
    return SingleHistoryModel(
      sessionId: json['session_id'] as String?,
      sessionTitle: json['session_title'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'] as String)
          : null,
      messages: (json['messages'] as List<dynamic>? ?? [])
          .map((m) => ChatMessage.fromJson(m as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'session_id': sessionId,
      'session_title': sessionTitle,
      'created_at': createdAt?.toIso8601String(),
      'messages': messages.map((m) => m.toJson()).toList(),
    };
  }
}

class ChatMessage {
  final int? id;
  final String? role;
  final String? content;
  final String? type;
  final DateTime? timestamp;

  ChatMessage({
    this.id,
    this.role,
    this.content,
    this.type,
    this.timestamp,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'] as int?,
      role: json['role'] as String?,
      content: json['content'] as String?,
      type: json['type'] as String?,
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'content': content,
      'type': type,
      'timestamp': timestamp?.toIso8601String(),
    };
  }
}
