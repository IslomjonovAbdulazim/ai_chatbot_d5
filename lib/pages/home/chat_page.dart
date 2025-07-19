import 'package:ai_chatbot_d5/models/message_model.dart';
import 'package:ai_chatbot_d5/providers/message_provider.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatPage extends StatefulWidget {
  final String id;
  final String title;

  const ChatPage({super.key, required this.id, required this.title});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageModel> messages = [];
  bool isLoading = false;
  final controller = TextEditingController();
  final focus = FocusNode();
  bool responding = false;

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    isLoading = true;
    setState(() {});
    messages = await MessageProvider.getAllMessages(widget.id);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff141718),
      appBar: AppBar(
        backgroundColor: Color(0xff141718),
        leading: CupertinoButton(
          onPressed: () {
            Get.back();
          },
          child: Icon(
            CupertinoIcons.chevron_left,
            color: Colors.white,
            size: 28,
          ),
        ),
        title: Text(
          widget.title,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          reverse: true,
          itemCount: messages.length,
          itemBuilder: (context, index) {
            final model = messages[index];
            return BubbleSpecialThree(
              text: model.content,
              color: Color(
                model.role == "user" ? 0xff292929 : 0xffD71E1E,
              ),
              textStyle: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              isSender: model.role == "user",
            );
          },
        ),
      ),
    );
  }
}
