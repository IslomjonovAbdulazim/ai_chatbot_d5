import 'dart:convert';

import 'package:ai_chatbot_d5/models/profile_model.dart';
import 'package:ai_chatbot_d5/utils/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileProvider {
  static Future<ProfileModel?> profile() async {
    final uri = Uri.parse(ApiConstants.profile);
    final db = await SharedPreferences.getInstance();
    final token = db.get("token");
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return ProfileModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<TokenUsageModel?> usage() async {
    final uri = Uri.parse(ApiConstants.usage);
    final db = await SharedPreferences.getInstance();
    final token = db.getString("token");
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      return TokenUsageModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<List<DailyUsageModel>> daily() async {
    final uri = Uri.parse(ApiConstants.usage);
    final db = await SharedPreferences.getInstance();
    final token = db.getString("token");
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    final body = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final jsonList = List.from(body);
      return jsonList.map((j) => DailyUsageModel.fromJson(j)).toList();
    } else {
      return [];
    }
  }
}
