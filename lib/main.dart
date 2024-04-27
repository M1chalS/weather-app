import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_page.dart';
import 'package:weather_app/themes/main_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather app',
      theme: MainTheme,
      home: const MyHomePage(),
    );
  }
}

