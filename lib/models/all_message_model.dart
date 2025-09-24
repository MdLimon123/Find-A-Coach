class AllMessageModel {
  final int? id;
  final int? room;
  final int sender;
  final String content;
  final List<String>? images;
  final bool? isSeen;
  final DateTime? timestamp;

  AllMessageModel({
     this.id,
     this.room,
    required this.sender,
    required this.content,
    this.images,
     this.isSeen,
     this.timestamp,
  });

  factory AllMessageModel.fromJson(Map<String, dynamic> json) {
    final content = (json['content'] ?? json['message'] ?? '').toString();
    final images = json['images'] != null
        ? List<String>.from(json['images'] as List)
        : null;
    final timestamp = json['timestamp'] != null
        ? DateTime.tryParse(json['timestamp'].toString())
        : null;

    return AllMessageModel(
      id: json['id'] as int?,
      room: json['room'] as int?,
      sender: json['sender'] is int
          ? json['sender'] as int
          : int.tryParse(json['sender']?.toString() ?? '') ?? 0,
      content: content,
      images: images,
      isSeen: json['is_seen'] as bool? ?? false,
      timestamp: timestamp,
    );
  }



  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'room': room,
      'sender': sender,
      'content': content,
      'images': images,
      'is_seen': isSeen,
      'timestamp': timestamp?.toIso8601String(),
    };
  }


  AllMessageModel copyWith({
    int? id,
    int? room,
    int? sender,
    String? content,
    List<String>? images,
    bool? isSeen,
    DateTime? timestamp,
  }) {
    return AllMessageModel(
      id: id ?? this.id,
      room: room ?? this.room,
      sender: sender ?? this.sender,
      content: content ?? this.content,
      images: images ?? this.images,
      isSeen: isSeen ?? this.isSeen,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
