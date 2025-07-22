import 'package:ai_chatbot_d5/models/message_model.dart';
import 'package:ai_chatbot_d5/providers/message_provider.dart';
import 'package:ai_chatbot_d5/widgets/snackbar_widget.dart';
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
  final scroll = ScrollController();

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scroll.hasClients) {
        scroll.jumpTo(scroll.position.maxScrollExtent);
      }
    });
  }

  void send() async {
    responding = true;
    setState(() {});
    final text = controller.text.trim();
    controller.clear();
    if (text.length <= 0 || text.length >= 250) {
      SnackbarWidget.error("Too Large or Empty", "");
    } else {
      await MessageProvider.sendMessage(text, widget.id);
      messages = await MessageProvider.getAllMessages(widget.id);
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scroll.hasClients) {
          scroll.jumpTo(scroll.position.maxScrollExtent);
        }
      });
    }
    responding = false;
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
        child: isLoading
            ? Center(child: CircularProgressIndicator(color: Colors.white))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: scroll,
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
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            focusNode: focus,
                            onTapOutside: (value) => focus.unfocus(),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                            ),
                            autocorrect: false,
                            keyboardAppearance: Brightness.dark,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xff292929),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Ask anything...",
                                hintStyle: GoogleFonts.inter(
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        SizedBox(width: 8),
                        responding
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : CupertinoButton(
                                color: Colors.white,
                                onPressed: () {
                                  send();
                                },
                                child: Icon(
                                  Icons.send,
                                  color: Colors.black,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
