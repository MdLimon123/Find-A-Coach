class ClientInboxModel {
  final int roomId;
  final InboxUser user;
  final LastMessage? lastMessage;
  final int unseenCount;
  final DateTime createdAt;

  const ClientInboxModel({
    required this.roomId,
    required this.user,
    this.lastMessage,
    required this.unseenCount,
    required this.createdAt,
  });

  factory ClientInboxModel.fromJson(Map<String, dynamic> json) {
    return ClientInboxModel(
      roomId: json['room_id'] ?? 0,
      user: InboxUser.fromJson(json['user'] ?? const {}),
      lastMessage: json['last_message'] == null
          ? null
          : LastMessage.fromJson(json['last_message']),
      unseenCount: json['unseen_count'] ?? 0,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'room_id': roomId,
    'user': user.toJson(),
    'last_message': lastMessage?.toJson(),
    'unseen_count': unseenCount,
    'created_at': createdAt.toIso8601String(),
  };
}

class InboxUser {
  final int userId;
  final String fullName;
  final String image;

  const InboxUser({
    required this.userId,
    required this.fullName,
    required this.image,
  });

  factory InboxUser.fromJson(Map<String, dynamic> json) {
    return InboxUser(
      userId: json['user_id'] ?? 0,
      fullName: json['full_name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'user_id': userId,
    'full_name': fullName,
    'image': image,
  };
}

class LastMessage {
  final String content;
  final DateTime timestamp;
  final int senderId;

  const LastMessage({
    required this.content,
    required this.timestamp,
    required this.senderId,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      content: json['content'] ?? '',
      timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
      senderId: json['sender_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'content': content,
    'timestamp': timestamp.toIso8601String(),
    'sender_id': senderId,
  };
}
