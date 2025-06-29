import 'package:ai_chatbot_d5/providers/auth_provider.dart';
import 'package:ai_chatbot_d5/utils/app_colors.dart';
import 'package:ai_chatbot_d5/utils/google_service.dart';
import 'package:ai_chatbot_d5/widgets/button_widget.dart';
import 'package:ai_chatbot_d5/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  UserGoogleAccount? user;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleText("Welcome to\nD5 GPT"),
              NormalText("Sign in with your Google account to get started"),
              SizedBox(height: 40),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : ButtonWidget(
                      onTap: () async {
                        isLoading = true;
                        setState(() {});
                        await AuthProvider.signIn();
                        isLoading = false;
                        setState(() {});
                      },
                      text: "Sign In With Google",
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
