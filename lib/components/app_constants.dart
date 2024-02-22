import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConsts {
  final TextStyle standartText = const TextStyle(
    fontFamily: "Jua",
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  final TextStyle syneMono = GoogleFonts.syneMono(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.black,
    decoration: TextDecoration.none,
    decorationThickness: 0,
  );

  static final AppConsts _instance = AppConsts._internal();

  factory AppConsts.getInstance() => _instance;

  AppConsts._internal(); // Özel yapıcı doğrudan örneklemeyi engeller
}
