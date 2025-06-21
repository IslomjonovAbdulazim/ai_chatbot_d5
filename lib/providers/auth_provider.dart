import 'dart:convert';

import 'package:ai_chatbot_d5/models/auth_models.dart';
import 'package:ai_chatbot_d5/utils/api_constants.dart';
import 'package:ai_chatbot_d5/utils/google_service.dart';
import 'package:ai_chatbot_d5/widgets/snackbar_widget.dart';
import 'package:http/http.dart' as http;

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
          "Content-Type":"application/json",
        },
        body: jsonEncode(model.toJson()),
      );
      final body = jsonDecode(response.body);
      if (response.statusCode == 200) {

      } else {

      }
    }
  }
}
