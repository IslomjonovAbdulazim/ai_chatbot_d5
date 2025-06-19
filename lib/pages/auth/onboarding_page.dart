import 'package:ai_chatbot_d5/utils/app_colors.dart';
import 'package:ai_chatbot_d5/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<String> titles = [
    "Unlock the Power Of Future AI",
    "Chat With Your Favourite Ai",
    "Boost Your Mind Power with Ai",
  ];
  List<String> bodies = [
    "Chat with the smartest AI Future Experience power of AI with us",
    "Chat with the smartest AI Future Experience power of AI with us",
    "Chat with the smartest AI Future Experience power of AI with us",
  ];
  List<String> images = [
    "assets/on-1.png",
    "assets/on-2.png",
    "assets/on-3.png",
  ];
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Image.asset(images[index]),
                        TitleText(titles[index]),
                        BodyText(bodies[index]),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
