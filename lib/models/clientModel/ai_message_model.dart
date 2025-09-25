import 'dart:convert';

class AiMessageModel{
  final String message;
  final bool isUser;
  final bool? isLoading;
  final String type;
  final Map<String, dynamic>? jsonData;

  AiMessageModel({required this.message, required this.isUser, this.isLoading,
    this.type = 'text',
    this.jsonData,});


  factory AiMessageModel.fromJson(Map<String, dynamic> json) {
    final type = json['type']?.toString() ?? 'text';

    Map<String, dynamic>? parsedJson;
    if (type == 'json' && json['content'] != null) {
      // Parse JSON string into Map
      parsedJson = {'coaches': jsonDecode(json['content'])};
    }

    return AiMessageModel(
      message: json['content']?.toString() ?? '',
      isUser: (json['role'] ?? 'assistant') == 'user',
      type: type,
      jsonData: parsedJson,
      isLoading: false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': message,
      'role': isUser ? 'user' : 'assistant',
      'type': type,
      'jsonData': jsonData,
    };
  }
}