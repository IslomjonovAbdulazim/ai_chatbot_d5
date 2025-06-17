import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final String hint;
  final bool isPassword;
  final IconData icon;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.focus,
    required this.hint,
    required this.isPassword,
    required this.icon,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
