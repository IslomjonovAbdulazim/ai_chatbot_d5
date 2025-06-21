import 'dart:convert';

import 'package:ai_chatbot_d5/models/auth_models.dart';
import 'package:ai_chatbot_d5/pages/auth/auth_page.dart';
import 'package:ai_chatbot_d5/pages/home/home_page.dart';
import 'package:ai_chatbot_d5/utils/api_constants.dart';
import 'package:ai_chatbot_d5/utils/google_service.dart';
import 'package:ai_chatbot_d5/widgets/snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider {
  static Future<void> signIn() async {
    final user = await GoogleService().signInWithGoogle();
    if (user == null) {
      SnackbarWidget.error("Cannot Sign In", "Something went wrong");
    } else {
      final uri = Uri.parse(ApiConstants.google);
      final model = AuthRequestModel(token: user!.idToken!);
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(model.toJson()),
      );
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        final data = AuthResponseModel.fromJson(body);
        final db = await SharedPreferences.getInstance();
        await db.setString("token", data.accessToken);
        SnackbarWidget.success(
          "Successfully Logged In",
          "Welcome back! Ready to start chatting.",
        );
        Get.offAll(HomePage());
      } else if (response.statusCode == 400) {
        SnackbarWidget.error(
          "Error with your Google account",
          body["detail"] ?? "Invalid Google Token",
        );
      } else {
        SnackbarWidget.error(
          "Something went wrong",
          body["detail"] ?? "No Detail",
        );
      }
    }
  }

  static Future<bool> navigate() async {
    final uri = Uri.parse(ApiConstants.verify);
    final db = await SharedPreferences.getInstance();
    final token = db.getString("token");
    if (token == null) {
      Get.offAll(AuthPage());
    } else {
      final response = await http.get(
        uri,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {}
    }
  }
}
