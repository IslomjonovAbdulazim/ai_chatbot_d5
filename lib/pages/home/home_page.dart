import 'package:ai_chatbot_d5/models/chat_model.dart';
import 'package:ai_chatbot_d5/pages/home/chat_page.dart';
import 'package:ai_chatbot_d5/pages/home/profile_page.dart';
import 'package:ai_chatbot_d5/providers/chat_provider.dart';
import 'package:ai_chatbot_d5/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ChatModel> chats = [];
  bool isLoading = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    chats = await ChatProvider.getAllChats();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141718),
      appBar: AppBar(
        backgroundColor: Color(0xff141718),
        surfaceTintColor: Color(0xff141718),
        leadingWidth: 100,
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Get.to(ProfilePage());
          },
          child: Image.asset("assets/logo.png"),
        ),
        centerTitle: true,
        title: TitleText("AIsha"),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () async {
              isLoading = true; // pdp_staff
              setState(() {});
              final res = await ChatProvider.newChat();
              if (res != null) {
                await Get.to(ChatPage(
                  id: res.id,
                  title: res.title,
                ));
              }
              load();
            },
            child: Icon(
              CupertinoIcons.chat_bubble_2_fill,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final model = chats[index];
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.2,
                      motion: ScrollMotion(),
                      children: [
                        NormalText("A"),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: CupertinoButton(
                        color: Color(0xff232627),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        onPressed: () async {
                          await Get.to(
                              ChatPage(id: model.id, title: model.title));
                          load();
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NormalText(model.title),
                                  DateText(model.createdAt),
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            TitleText("${model.messageCount}"),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
