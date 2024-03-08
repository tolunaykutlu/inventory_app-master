import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConsts {
  static TextStyle standartText({Color c = Colors.black, double fSize = 15}) {
    return TextStyle(
      fontFamily: "Jua",
      color: c,
      fontSize: fSize,
      fontWeight: FontWeight.w600,
    );
  }

  static Text appText(String text) {
    return Text(
      text,
      style: syneMono(),
    );
  }

  static TextStyle syneMono({Color c = Colors.black, double fSize = 15}) {
    return GoogleFonts.syneMono(
      fontWeight: FontWeight.bold,
      fontSize: fSize,
      color: c,
      decoration: TextDecoration.none,
      decorationThickness: 0,
    );
  }

  // Singleton pattern removed (not needed for direct usage)

  AppConsts._internal(); // Private constructor (remains for completeness)
}
