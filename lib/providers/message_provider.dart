import 'dart:convert';

import 'package:ai_chatbot_d5/providers/auth_provider.dart';
import 'package:ai_chatbot_d5/utils/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MessageProvider {
  static Future<bool> sendMessage(
    String content,
    String id,
  ) async {
    final body = jsonEncode({"content": content});
    final uri = Uri.parse(ApiConstants.message(id));
    final db = await SharedPreferences.getInstance();
    final token = db.get("token");
    final response = await http.post(
      uri,
      body: body,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

  }
}
