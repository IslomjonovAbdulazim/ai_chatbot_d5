import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

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
        fontWeight: FontWeight.w700,
      ),
      textAlign: TextAlign.center,
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
      textAlign: TextAlign.center,
    );
  }
}

class NormalText extends StatelessWidget {
  final String text;

  const NormalText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class DateText extends StatelessWidget {
  final DateTime date;

  const DateText(this.date);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${DateFormat.yMMMMd().format(date)} at ${DateFormat.Hms().format(date)}",
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class SubtitleText extends StatelessWidget {
  final String text;

  const SubtitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
