import 'package:ai_chatbot_d5/providers/auth_provider.dart';
import 'package:ai_chatbot_d5/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Salom",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            ButtonWidget(
              text: "Logout",
              onTap: () {
                AuthProvider.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
