import 'package:ai_chatbot_d5/models/chat_model.dart';
import 'package:ai_chatbot_d5/providers/chat_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      ),
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final model = chats[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: CupertinoButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
