import 'dart:convert';

import 'package:ai_chatbot_d5/main.dart';
import 'package:ai_chatbot_d5/models/chat_model.dart';
import 'package:ai_chatbot_d5/utils/api_constants.dart';
import 'package:ai_chatbot_d5/widgets/snackbar_widget.dart';
import 'package:http/http.dart' as http;

class ChatProvider {
  static Future<List<ChatModel>> getAllChats() async {
    final uri = Uri.parse(ApiConstants.chats);
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      final body = List.from(jsonDecode(response.body));
      return body.map((json) => ChatModel.fromJson(json)).toList();
    }
    SnackbarWidget.error("Cannot Load Chats", "Something went wrong");
    return [];
  }

  static Future<bool> newChat() async {
    final uri = Uri.parse(ApiConstants.chats);
    final response = await http.post(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      SnackbarWidget.success("New Chat Created", "Successfully");
      return true;
    }
    SnackbarWidget.error("Cannot start new chat", "Something went wrong");
    return false;
  }

  static Future<bool> deleteChat(String id) async {
    final uri = Uri.parse("${ApiConstants.chats}/$id");
    final response = await http.delete(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      SnackbarWidget.success("Chat Deleted", "Successfully");
      return true;
    }
    SnackbarWidget.error("Cannot Delete Chat", "Something went wrong");
    return false;
  }
}
