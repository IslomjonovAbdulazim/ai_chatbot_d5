import 'package:ai_chatbot_d5/pages/auth/onboarding_page.dart';
import 'package:ai_chatbot_d5/utils/app_colors.dart';
import 'package:ai_chatbot_d5/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    // Logic ...
    await Future.delayed(Duration(milliseconds: 500));

    if (false) {
      Get.off(OnboardingPage(), transition: Transition.fade);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
          width: 150,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TitleText("AIsha"),
            BodyText("by D5 Group"),
          ],
        ),
      ),
    );
  }
}
