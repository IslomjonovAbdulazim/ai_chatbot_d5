import 'dart:convert';

import 'package:ai_chatbot_d5/models/message_model.dart';
import 'package:ai_chatbot_d5/utils/api_constants.dart';
import 'package:ai_chatbot_d5/widgets/snackbar_widget.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MessageProvider {
  static Future<MessageModel?> sendMessage(
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
    final r = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return MessageModel.fromJson(r);
    } else {
      SnackbarWidget.error(
        "Something Went Wrong",
        r["detail"] ?? "Unknown Error",
      );
      return null;
    }
  }

  static Future<List<MessageModel>> getAllMessages(String id) async {
    final uri = Uri.parse(ApiConstants.message(id));
    final db = await SharedPreferences.getInstance();
    final token = db.get("token");
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    final r = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final list = List.from(r);
      return list.map((json) => MessageModel.fromJson(json)).toList();
    } else {
      SnackbarWidget.error(
        "Something Went Wrong",
        r["detail"] ?? "Unknown Error",
      );
      return [];
    }
  }
}
