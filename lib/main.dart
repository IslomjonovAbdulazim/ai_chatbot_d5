import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/auth/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJ0ZXN0LXVzZXItMTIzIiwiZXhwIjoxNzUzMzU5NDM3LCJpYXQiOjE3NTA3Njc0Mzd9.JoFPZ1qT9jbG-Vj2rQ8eb-AFXvtt0pHVj-4bie1505c";
  final db = await SharedPreferences.getInstance();
  await db.setString("token", token);
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => AiChatbotApp(),
    ),
  );
}

class AiChatbotApp extends StatelessWidget {
  const AiChatbotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
