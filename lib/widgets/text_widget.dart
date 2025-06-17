import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 35,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  final String text;

  const BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Color(0xff8E9295),
        fontSize: 16,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
