import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final MainTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 242, 245, 229),
      background: const Color.fromARGB(255, 20, 43, 55),
      secondary: const Color.fromARGB(255, 49, 95, 111),
      tertiary: const Color.fromARGB(255, 244, 205, 122),
      outline: const Color.fromARGB(255, 17, 45, 65),
      brightness: Brightness.dark),
    textTheme: GoogleFonts.latoTextTheme().apply(
      bodyColor: const Color.fromARGB(255, 242, 245, 229),
      displayColor: const Color.fromARGB(255, 242, 245, 229),
    ),
  primaryColor: const Color.fromARGB(255, 49, 45, 65),
);
