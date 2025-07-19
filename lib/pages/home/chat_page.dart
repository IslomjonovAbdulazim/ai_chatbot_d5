import 'package:ai_chatbot_d5/models/message_model.dart';
import 'package:ai_chatbot_d5/providers/message_provider.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String id;

  const ChatPage({super.key, required this.id});

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
      appBar: AppBar(),
    );
  }
}
