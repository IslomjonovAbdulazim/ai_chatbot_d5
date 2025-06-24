class ChatModel {
  // members
  late String id;
  late String title;
  late DateTime createdAt;
  late int messageCount;

  // constructor
  ChatModel({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.messageCount,
  });

  // fromJson
  ChatModel.fromJson(Map json) {
    id = json["id"];
    title = json["title"];
    createdAt = DateTime.parse(json["created_at"]);
    messageCount = json["message_count"];
  }

  // toJson
  Map toJson() => {
    "id": id,
    "title": title,
    "created_at": createdAt.toIso8601String(),
    "message_count": messageCount,
  };
}
