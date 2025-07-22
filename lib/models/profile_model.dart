class ProfileModel {
  late String id;
  late String name;
  late String email;
  late String? avatar;
  late DateTime createdAt;

  ProfileModel.fromJson(Map json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    avatar = json["avatar"];
    createdAt = DateTime.parse(json["created_at"]);
  }

  Map toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
        "created_at": createdAt.toIso8601String(),
      };
}

class TokenUsageModel {
  late int totalTokens;
  late int totalMessages;
  late int todayTokens;
  late int todayMessages;
  late int thisWeekTokens;
  late int thisMonthTokens;

  TokenUsageModel.fromJson(Map json) {
    totalTokens = json["total_tokens"];
    totalMessages = json["total_messages"];
    todayTokens = json["today_tokens"];
    todayMessages = json["today_messages"];
    thisWeekTokens = json["this_week_tokens"];
    thisMonthTokens = json["this_month_tokens"];
  }
}

class DailyUsageModel {
  late DateTime date;
  late int tokens;
  late int messages;
  late int inputTokens;
  late int outputTokens;

  DailyUsageModel.fromJson(Map json) {
    date = DateTime.parse(json["date"]);
    tokens = json["tokens"];
    messages = json["messages"];
    inputTokens = json["input_tokens"];
    outputTokens = json["output_tokens"];
  }
}
