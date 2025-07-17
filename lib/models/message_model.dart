import 'package:ai_chatbot_d5/main.dart';

class MessageModel {
  late String id;
  late String role;
  late String content;
  late int tokens;
  late DateTime createdAt;

  MessageModel({
    required this.id,
    required this.role,
    required this.content,
    required this.tokens,
    required this.createdAt,
  });

  MessageModel.fromJson(Map json) {
    id = json["id"];
    role = json["role"];
    content = json["content"];
    tokens = json["tokens"];
    createdAt = DateTime.parse(json["created_at"]);
  }

  Map toJson() => {
    "id": id,
    "role": role,
    "content": content,
    "tokens": token,
    "created_at": createdAt.toIso8601String(),
  };
}
