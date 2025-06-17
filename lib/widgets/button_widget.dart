import 'package:flutter/cupertino.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final void Function() onTap;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      child: Center(child: Text(text)),
    );
  }
}
