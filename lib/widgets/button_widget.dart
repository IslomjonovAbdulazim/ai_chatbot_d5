import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

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
      padding: EdgeInsets.symmetric(vertical: 18),
      borderRadius: BorderRadius.circular(20),
      color: Color(0xff1B1E20),
      onPressed: onTap,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: CupertinoColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
