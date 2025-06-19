import 'package:ai_chatbot_d5/pages/auth/auth_page.dart';
import 'package:ai_chatbot_d5/utils/app_colors.dart';
import 'package:ai_chatbot_d5/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  currentPage = value;
                  setState(() {});
                },
                controller: controller,
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xff232627),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: currentPage == 0
                        ? null
                        : () {
                            currentPage--;
                            controller.animateToPage(
                              currentPage,
                              curve: Curves.linear,
                              duration: Duration(milliseconds: 300),
                            );
                            setState(() {});
                          },
                    child: Icon(
                      CupertinoIcons.chevron_left,
                      color: currentPage == 0
                          ? Colors.grey.shade800
                          : Colors.white,
                      size: 28,
                    ),
                  ),
                  Container(
                    width: 2,
                    height: 25,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (currentPage == 2) {
                        Get.offAll(AuthPage(), transition: Transition.fade);
                      } else {
                        currentPage++;
                        controller.animateToPage(
                          currentPage,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    },
                    child: Icon(
                      CupertinoIcons.chevron_right,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
